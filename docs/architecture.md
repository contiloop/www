# Architecture

A Claude Code plugin with no runtime of its own: Markdown instructions that the Claude Code agent follows, plus two shell scripts. There is no server, no database, no network call. Everything the skill produces is a file in the author's document folder or one file under the author's home directory.

## Components

```
.claude-plugin/marketplace.json      one plugin entry "www", source ./claude
claude/.claude-plugin/plugin.json    plugin "www"
claude/skills/write/SKILL.md         the skill entry; the only file loaded at start
claude/skills/write/references/      seven files, each loaded at the step it governs
scripts/check.sh                     structure check of the plugin
tests/ads-introduction/              acceptance fixture: record, run steps, mechanical check
```

The marketplace manifest points at `./claude`; Claude Code installs that folder as a versioned copy under `~/.claude/plugins/cache/www/www/<version>/` and exposes the skill as `/www:write`. The repository is the source; the installed copy is what runs.

Reference files and the step each governs:

| Reference | Governs |
|---|---|
| `design-format.md` | the shape and rules of `design.md` |
| `elicit.md` | questions, proposals, level recognition, contradictions |
| `decompose.md` | reading notes, outlines or pasted plans as material |
| `existing-manuscript.md` | starting from text the author wrote before the record existed |
| `writing-rules.md` | the sentence rules the drafting and restatement checks apply |
| `drafting.md` | drafting, revision, stale drafts, the style-source list |
| `review.md` | self-check, restatement check, independent check, per-turn re-comparison, hand edits |

`SKILL.md` names every reference; `scripts/check.sh` fails when a reference exists that `SKILL.md` does not name or when `SKILL.md` names one that does not exist.

## Files at run time

Per document, in the document folder (the directory `/www:write` runs in, or the path given as its argument):

- `design.md`: the record, the authority every check compares against.
- `draft.md`: the text, one heading per section.
- An existing manuscript, when present: read-only input.

Per author: `~/.claude/www/writing-rules.md`, rules accepted at run time; read beside the shipped `references/writing-rules.md` and winning on conflict. Created on the first accepted rule. It lives outside the plugin because the installed plugin copy is replaced on update.

## Flow of one turn

```
author's message
  → re-read design.md and draft.md in full
  → re-compare the working section against its draft; report a disagreement first
  → infer the level (document-wide or per section) from the request and Status
  → one of:
      discussion: enumerate obligations → resolve from the record → ask what survives / propose alternatives
      recording:  accepted line → parts 1–4 of design.md → quoted back in the reply
      drafting:   section's detailed logic + style sources → draft text
                  → self-check (mapping, 7 comparisons) → independent check (subagent) → shown
      revision:   record updated first → touched sentences only → self-check
  → any explanation, summary or translation of the draft → restatement check against the record
```

The independent check is the one component that runs outside the main conversation: a fresh general-purpose subagent that receives only the section's Detailed logic entry, its Emphasis and wording entry and the draft text, and returns a list of mismatches. It never sees the conversation, so a drift the writer produced from the conversation is compared against the record alone.

## Data flow of meaning

Author's words (mostly Korean) → recorded as an English line with the author's words verbatim beside it → rendered as a sentence in the document's language → every check compares the sentence, and every restatement of it, with the recorded line, never with another sentence. The record is the single point the chain is anchored to; the verbatim words let the author see where the English line departed from what they said.

## Boundaries

- The plugin writes only `design.md`, `draft.md` and `~/.claude/www/writing-rules.md`. It never writes into its own installed files and never modifies a manuscript.
- The repository's `tests/ads-introduction/` is a fixture, not part of the installed plugin; `scripts/check.sh` is a developer tool, not loaded by the skill.
- The author's Obsidian vault is not read at run time; the shipped rules file carries the author's writing rules on its own.
