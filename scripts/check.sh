#!/bin/sh
# Structure check for the www plugin. Exit 0 when every check passes.
# Run from anywhere: it locates the repository from its own path.
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
SKILL_DIR="$ROOT/claude/skills/write"
REFS="$SKILL_DIR/references"
SKILL="$SKILL_DIR/SKILL.md"
fail=0
ok()   { printf 'ok    %s\n' "$1"; }
bad()  { printf 'FAIL  %s\n' "$1"; fail=1; }
note() { printf 'note  %s\n' "$1"; }

if ! command -v python3 >/dev/null 2>&1; then
  bad "python3 not found (needed to parse the manifests)"
  exit 1
fi

# 1. Marketplace manifest names plugin www with source ./claude
python3 - "$ROOT/.claude-plugin/marketplace.json" <<'PY' && ok "marketplace.json names plugin www (source ./claude)" || bad "marketplace.json invalid or does not name plugin www with source ./claude"
import json, sys
m = json.load(open(sys.argv[1]))
ps = m["plugins"]
assert any(p["name"] == "www" and p["source"] == "./claude" for p in ps)
PY

# 2. Plugin manifest names www
python3 - "$ROOT/claude/.claude-plugin/plugin.json" <<'PY' && ok "plugin.json names www" || bad "plugin.json invalid or name is not www"
import json, sys
assert json.load(open(sys.argv[1]))["name"] == "www"
PY

# 3. Every reference file has a top-level heading and a non-empty body
for f in "$REFS"/*.md; do
  [ -e "$f" ] || { note "no reference files yet"; break; }
  name=$(basename "$f")
  if ! head -n 1 "$f" | grep -q '^# '; then bad "references/$name: first line is not a top-level heading"; continue; fi
  if [ "$(sed '1d' "$f" | tr -d '[:space:]' | wc -c)" -eq 0 ]; then bad "references/$name: empty body"; continue; fi
  ok "references/$name has a heading and a body"
done

# 4. SKILL.md checks (skipped while SKILL.md is absent)
if [ ! -f "$SKILL" ]; then
  note "SKILL.md absent: frontmatter and reference cross-checks skipped"
else
  if [ "$(head -n 1 "$SKILL")" != "---" ]; then bad "SKILL.md: no frontmatter"; fi
  if ! sed -n '2,/^---$/p' "$SKILL" | grep -q '^name: write$'; then bad "SKILL.md: frontmatter name is not write"; else ok "SKILL.md frontmatter names write"; fi
  # every references/<file>.md named in SKILL.md exists
  for ref in $(grep -o 'references/[A-Za-z0-9._-]*\.md' "$SKILL" | sort -u); do
    if [ -f "$SKILL_DIR/$ref" ]; then ok "SKILL.md names $ref and it exists"; else bad "SKILL.md names $ref but it does not exist"; fi
  done
  # every file in references/ is named by SKILL.md
  for f in "$REFS"/*.md; do
    [ -e "$f" ] || break
    name=$(basename "$f")
    if ! grep -q "references/$name" "$SKILL"; then bad "references/$name is not named by SKILL.md"; fi
  done
fi

[ $fail -eq 0 ] && printf 'all checks passed\n' || printf 'some checks failed\n'
exit $fail
