#!/bin/sh
# Structure check for the www plugin. Exit 0 when every check passes.
# Run from anywhere: it locates the repository from its own path.
#
# Checks the marketplace and platform manifests, the canonical skill source in
# src/skills/write/, and the generated packages claude/ and codex/plugin/,
# including that they match a fresh build of the source.
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
SRC="$ROOT/src/skills/write"
REFS="$SRC/references"
SKILL="$SRC/SKILL.md"
PLAT="$ROOT/platform"
fail=0
ok()  { printf 'ok    %s\n' "$1"; }
bad() { printf 'FAIL  %s\n' "$1"; fail=1; }

if ! command -v python3 >/dev/null 2>&1; then
  bad "python3 not found (needed to parse the manifests)"
  exit 1
fi

# Temporary directory for the staleness build; removed on any exit.
TMP=$(mktemp -d "${TMPDIR:-/tmp}/www-check.XXXXXX")
trap 'rm -rf "$TMP"' EXIT INT TERM HUP

# 1. Marketplace manifests
python3 - "$ROOT/.claude-plugin/marketplace.json" <<'PY' && ok ".claude-plugin/marketplace.json names plugin www (source ./claude)" || bad ".claude-plugin/marketplace.json invalid or does not name plugin www with source ./claude"
import json, sys
m = json.load(open(sys.argv[1]))
assert any(p["name"] == "www" and p["source"] == "./claude" for p in m["plugins"])
PY

python3 - "$ROOT/.agents/plugins/marketplace.json" <<'PY' && ok ".agents/plugins/marketplace.json names plugin www (local ./codex/plugin)" || bad ".agents/plugins/marketplace.json invalid or does not name plugin www with local source ./codex/plugin"
import json, sys
m = json.load(open(sys.argv[1]))
assert any(p["name"] == "www"
           and p["source"]["source"] == "local"
           and p["source"]["path"] == "./codex/plugin" for p in m["plugins"])
PY

# 2. Platform manifests: name www, one shared non-empty version
manifest_field() {
  python3 -c 'import json, sys; v = json.load(open(sys.argv[1])).get(sys.argv[2], ""); print(v if isinstance(v, str) else "")' "$1" "$2" 2>/dev/null
}
versions=""
for m in claude/plugin.json codex/plugin.json codex/plugin.portable.json; do
  if ! python3 -c 'import json, sys; json.load(open(sys.argv[1]))' "$PLAT/$m" 2>/dev/null; then
    bad "platform/$m does not parse"; continue
  fi
  if [ "$(manifest_field "$PLAT/$m" name)" = "www" ]; then ok "platform/$m names www"; else bad "platform/$m name is not www"; fi
done
V1=$(manifest_field "$PLAT/claude/plugin.json" version)
V2=$(manifest_field "$PLAT/codex/plugin.json" version)
V3=$(manifest_field "$PLAT/codex/plugin.portable.json" version)
if [ -n "$V1" ] && [ "$V1" = "$V2" ] && [ "$V1" = "$V3" ]; then
  ok "platform manifests share version $V1"
else
  bad "platform manifest versions differ or are empty: claude/plugin.json='$V1' codex/plugin.json='$V2' codex/plugin.portable.json='$V3'"
fi

# 3. Skill source: references, SKILL.md frontmatter, cross-references
for f in "$REFS"/*.md; do
  [ -e "$f" ] || { bad "src references/: no reference files"; break; }
  name=$(basename "$f")
  if ! head -n 1 "$f" | grep -q '^# '; then bad "src references/$name: first line is not a top-level heading"; continue; fi
  if [ "$(sed '1d' "$f" | tr -d '[:space:]' | wc -c)" -eq 0 ]; then bad "src references/$name: empty body"; continue; fi
  ok "src references/$name has a heading and a body"
done

if [ ! -f "$SKILL" ]; then
  bad "src SKILL.md is missing"
else
  if [ "$(head -n 1 "$SKILL")" != "---" ]; then bad "src SKILL.md: no frontmatter"; fi
  if sed -n '2,/^---$/p' "$SKILL" | grep -q '^name: write$'; then ok "src SKILL.md frontmatter names write"; else bad "src SKILL.md: frontmatter name is not write"; fi
  if grep -q '^allowed-tools:' "$SKILL" || grep -q '^disable-model-invocation:' "$SKILL"; then
    bad "src SKILL.md carries a platform key (allowed-tools or disable-model-invocation)"
  else
    ok "src SKILL.md carries no platform keys"
  fi
  for ref in $(grep -o 'references/[A-Za-z0-9._-]*\.md' "$SKILL" | sort -u); do
    if [ -f "$SRC/$ref" ]; then ok "src SKILL.md names $ref and it exists"; else bad "src SKILL.md names $ref but it does not exist"; fi
  done
  for f in "$REFS"/*.md; do
    [ -e "$f" ] || break
    name=$(basename "$f")
    if ! grep -q "references/$name" "$SKILL"; then bad "src references/$name is not named by SKILL.md"; fi
  done
fi

# 3b. Type rules files: exactly the four, each with a heading and a body, named in SKILL.md
TYPES="$REFS/types"
for t in presentation-script research-paper report essay; do
  f="$TYPES/$t.md"
  if [ ! -f "$f" ]; then bad "src references/types/$t.md is missing"; continue; fi
  if ! head -n 1 "$f" | grep -q '^# '; then bad "src references/types/$t.md: first line is not a top-level heading"; continue; fi
  if [ "$(sed '1d' "$f" | tr -d '[:space:]' | wc -c)" -eq 0 ]; then bad "src references/types/$t.md: empty body"; continue; fi
  ok "src references/types/$t.md has a heading and a body"
done
for f in "$TYPES"/*; do
  case "$(basename "$f")" in presentation-script.md|research-paper.md|report.md|essay.md) ;; *) bad "src references/types/$(basename "$f") is not one of the four type files";; esac
done
if grep -q 'references/types/<type>.md' "$SKILL"; then ok "src SKILL.md names references/types/<type>.md"; else bad "src SKILL.md does not name references/types/<type>.md"; fi

# 4. Codex skill metadata
YAML="$PLAT/codex/skills/write/agents/openai.yaml"
if [ -f "$YAML" ] && grep -q '^ *allow_implicit_invocation: false *$' "$YAML"; then
  ok "platform/codex openai.yaml sets allow_implicit_invocation: false"
else
  bad "platform/codex/skills/write/agents/openai.yaml missing or lacks allow_implicit_invocation: false"
fi

# 5. Staleness: the committed packages must equal a fresh build of the source
build_log="$TMP/build.log"
if OUT_DIR="$TMP" sh "$ROOT/scripts/build.sh" >"$build_log" 2>&1; then
  ok "build.sh succeeds from the current source"
  for pkg in claude codex/plugin; do
    if [ ! -d "$TMP/$pkg" ]; then bad "$pkg/: build produced no output"; continue; fi
    if [ ! -d "$ROOT/$pkg" ]; then bad "$pkg/: committed package is missing"; continue; fi
    if diffs=$(diff -rq "$TMP/$pkg" "$ROOT/$pkg" 2>&1) && [ -z "$diffs" ]; then
      ok "$pkg/ matches a fresh build"
    else
      bad "$pkg/ is stale: run scripts/build.sh. $(printf '%s\n' "$diffs" | head -n 3 | sed "s|$TMP/|<build>/|g; s|$ROOT/||g" | tr '\n' ';')"
    fi
  done
else
  bad "build.sh failed: $(tail -n 1 "$build_log")"
fi

# 6. Generated outputs
CS="$ROOT/claude/skills/write/SKILL.md"
XS="$ROOT/codex/plugin/skills/write/SKILL.md"
if [ -f "$CS" ]; then
  if [ "$(grep -c '^disable-model-invocation: true$' "$CS")" -eq 1 ]; then ok "claude SKILL.md has one disable-model-invocation: true"; else bad "claude SKILL.md: disable-model-invocation: true not present exactly once"; fi
  if [ "$(grep -c '^allowed-tools: ' "$CS")" -eq 1 ]; then ok "claude SKILL.md has one allowed-tools line"; else bad "claude SKILL.md: allowed-tools not present exactly once"; fi
else
  bad "claude/skills/write/SKILL.md is missing"
fi
if [ -f "$XS" ]; then
  if grep -q '^allowed-tools:' "$XS" || grep -q '^disable-model-invocation:' "$XS"; then
    bad "codex SKILL.md carries Claude frontmatter keys"
  else
    ok "codex SKILL.md carries no Claude frontmatter keys"
  fi
else
  bad "codex/plugin/skills/write/SKILL.md is missing"
fi
if [ -f "$ROOT/codex/plugin/skills/write/agents/openai.yaml" ]; then ok "codex package has agents/openai.yaml"; else bad "codex/plugin/skills/write/agents/openai.yaml is missing"; fi
for pkg in claude codex/plugin; do
  if [ -e "$ROOT/$pkg/skills/write/AGENTS.md" ]; then bad "$pkg/skills/write/AGENTS.md must not be packaged"; else ok "$pkg/ has no skills/write/AGENTS.md"; fi
done

[ $fail -eq 0 ] && printf 'all checks passed\n' || printf 'some checks failed\n'
exit $fail
