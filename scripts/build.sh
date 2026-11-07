#!/bin/sh
# Build the platform packages of the www plugin from the canonical skill source.
#
#   src/skills/write/   canonical skill (SKILL.md, references/); AGENTS.md is project notes
#   platform/claude/    Claude plugin.json
#   platform/codex/     Codex plugin.json, plugin.portable.json, skills/write/agents/openai.yaml
#   claude/             generated Claude plugin (committed)
#   codex/plugin/       generated Codex plugin (committed)
#
# Runs from any directory. Builds into a temporary directory and replaces the
# two output folders only after every step and guard has passed. When OUT_DIR
# is set and non-empty, writes $OUT_DIR/claude and $OUT_DIR/codex/plugin
# instead and leaves the repository's outputs untouched.
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SRC="$ROOT/src/skills/write"
PLAT="$ROOT/platform"
CLAUDE_TOOLS="Read, Edit, Write, Bash, Grep, Glob, Agent, AskUserQuestion"

fail() { echo "build failed: $1" >&2; exit 1; }

command -v python3 >/dev/null 2>&1 || fail "python3 not found"
[ -f "$SRC/SKILL.md" ] || fail "missing $SRC/SKILL.md"

# Version guard: the three platform manifests must carry the same non-empty version.
manifest_version() {
  python3 -c 'import json, sys; print(json.load(open(sys.argv[1])).get("version", ""))' "$1"
}
V1=$(manifest_version "$PLAT/claude/plugin.json")
V2=$(manifest_version "$PLAT/codex/plugin.json")
V3=$(manifest_version "$PLAT/codex/plugin.portable.json")
if [ -z "$V1" ] || [ -z "$V2" ] || [ -z "$V3" ] || [ "$V1" != "$V2" ] || [ "$V1" != "$V3" ]; then
  echo "build failed: manifest versions differ or are empty:" >&2
  echo "  platform/claude/plugin.json:          '$V1'" >&2
  echo "  platform/codex/plugin.json:           '$V2'" >&2
  echo "  platform/codex/plugin.portable.json:  '$V3'" >&2
  exit 1
fi

# Source guard: platform keys belong to the build, not the source.
if grep -q '^allowed-tools:' "$SRC/SKILL.md" || grep -q '^disable-model-invocation:' "$SRC/SKILL.md"; then
  fail "source SKILL.md carries a platform key (allowed-tools or disable-model-invocation)"
fi

if [ -n "${OUT_DIR:-}" ]; then
  DEST="$OUT_DIR"
else
  DEST="$ROOT"
fi
mkdir -p "$DEST/codex"

# Build next to the destination so the final moves stay on one filesystem.
TMP=$(mktemp -d "$DEST/.build.XXXXXX")
trap 'rm -rf "$TMP"' EXIT INT TERM
OUT="$TMP/out"
mkdir -p "$OUT"

# Copy the skill source without project notes and Finder metadata.
copy_skill() {
  mkdir -p "$1"
  cp -R "$SRC/." "$1/"
  rm -f "$1/AGENTS.md"
  find "$1" -name .DS_Store -exec rm -f {} +
}

# Claude package
mkdir -p "$OUT/claude/.claude-plugin"
copy_skill "$OUT/claude/skills/write"
CLAUDE_TOOLS="$CLAUDE_TOOLS" python3 - "$OUT/claude/skills/write/SKILL.md" <<'PY'
import os, sys
path = sys.argv[1]
lines = open(path, encoding="utf-8").read().split("\n")
if not lines or lines[0] != "---":
    sys.exit("SKILL.md does not start with a frontmatter block")
try:
    end = lines.index("---", 1)
except ValueError:
    sys.exit("SKILL.md frontmatter has no closing ---")
inject = ["disable-model-invocation: true", "allowed-tools: " + os.environ["CLAUDE_TOOLS"]]
lines[end:end] = inject
open(path, "w", encoding="utf-8").write("\n".join(lines))
PY
f="$OUT/claude/skills/write/SKILL.md"
[ "$(grep -c '^disable-model-invocation: true$' "$f")" -eq 1 ] || fail "disable-model-invocation not injected exactly once"
[ "$(grep -c "^allowed-tools: $CLAUDE_TOOLS\$" "$f")" -eq 1 ] || fail "allowed-tools not injected exactly once"
cp "$PLAT/claude/plugin.json" "$OUT/claude/.claude-plugin/plugin.json"
echo "built claude/"

# Codex package
mkdir -p "$OUT/codex/plugin/.codex-plugin"
copy_skill "$OUT/codex/plugin/skills/write"
mkdir -p "$OUT/codex/plugin/skills/write/agents"
cp "$PLAT/codex/skills/write/agents/openai.yaml" "$OUT/codex/plugin/skills/write/agents/openai.yaml"
cp "$PLAT/codex/plugin.portable.json" "$OUT/codex/plugin/plugin.json"
cp "$PLAT/codex/plugin.json" "$OUT/codex/plugin/.codex-plugin/plugin.json"
f="$OUT/codex/plugin/skills/write/SKILL.md"
if grep -q '^allowed-tools:' "$f" || grep -q '^disable-model-invocation:' "$f"; then
  fail "Claude frontmatter keys leaked into the Codex SKILL.md"
fi
[ -f "$OUT/codex/plugin/skills/write/agents/openai.yaml" ] || fail "openai.yaml missing from the Codex package"
echo "built codex/plugin/"

# Publish: replace the outputs whole, only now that everything passed. The old
# outputs are parked inside TMP so a failed move can put them back.
OLD="$TMP/old"
mkdir -p "$OLD/codex"
[ -e "$DEST/claude" ] && mv "$DEST/claude" "$OLD/claude"
[ -e "$DEST/codex/plugin" ] && mv "$DEST/codex/plugin" "$OLD/codex/plugin"
if ! mv "$OUT/claude" "$DEST/claude" || ! mv "$OUT/codex/plugin" "$DEST/codex/plugin"; then
  rm -rf "$DEST/claude" "$DEST/codex/plugin"
  [ -e "$OLD/claude" ] && mv "$OLD/claude" "$DEST/claude"
  [ -e "$OLD/codex/plugin" ] && mv "$OLD/codex/plugin" "$DEST/codex/plugin"
  fail "could not publish the generated outputs"
fi
echo "build ok"
