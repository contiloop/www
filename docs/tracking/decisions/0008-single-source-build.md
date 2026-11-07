# 0008 One skill source, generated packages per platform

Context: the author uses both Claude Code and Codex and asked for the skill in Codex. The two tools want different frontmatter and manifests but the same skill text; two copies kept by hand would drift, and a correction made in one would not reach the other.

Decision: the skill text lives once in `src/skills/write/`; `platform/` holds each tool's manifests and overlay; `scripts/build.sh` generates `claude/` and `codex/plugin/`, both committed because the installers read them from the repository; `scripts/check.sh` compares both against a fresh build so a hand edit in an output or a stale output fails. The skill text itself names no platform (no command, no tool name), so one text runs on both.

Alternatives: deriving the Codex package from `claude/` (privileges one platform and keeps platform keys in the editable file); two hand-kept copies (drift); per-platform sentence overlays (two texts to test); a Codex-only rename of the skill (would change the Claude command too, since the name is shared).

Consequences: edits go to `src/` and `platform/`, never to the packages; a release raises three versions together; adding a third host (for example GitHub Copilot) is a new `platform/` overlay and a build leg, not a copy of the skill.
