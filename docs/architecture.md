# Architecture

A plugin for Claude Code and Codex with no runtime of its own: Markdown instructions that the agent follows, plus three shell scripts. There is no server, no database, no network call. Everything the skill produces is a file in the author's document folder.

## Components

```
src/skills/write/SKILL.md            canonical skill entry; frontmatter has name and description only
src/skills/write/references/         seven files, each loaded at the step it governs, and types/ with one rules file per document type
src/skills/write/AGENTS.md           project notes for the skill folder; not part of either package
platform/claude/plugin.json          Claude manifest
platform/codex/plugin.json           Codex manifest (.codex-plugin form)
platform/codex/plugin.portable.json  Codex root manifest (Agent Plugins 1.0 form)
platform/codex/skills/write/agents/openai.yaml   Codex display strings; implicit invocation off
scripts/build.sh                     generates claude/ and codex/plugin/ from src/ and platform/
scripts/check.sh                     structure check: source, manifests, and both packages against a fresh build
.claude-plugin/marketplace.json      Claude marketplace: plugin "www", source ./claude
.agents/plugins/marketplace.json     Codex marketplace: plugin "www", local path ./codex/plugin
claude/                              generated Claude package (committed)
codex/plugin/                        generated Codex package (committed)
tests/ads-introduction/              acceptance fixture: record, run steps for both platforms, mechanical check
```

The skill text exists once, in `src/skills/write/`. `scripts/build.sh` copies it into both packages, inserting `disable-model-invocation: true` and `allowed-tools: …` into the Claude copy's frontmatter and adding `agents/openai.yaml` to the Codex copy. Both packages are committed because each installer reads its folder from the repository; a hand edit inside `claude/` or `codex/plugin/` is overwritten by the next build and fails the structure check, which compares both against a fresh build.

Claude Code installs `claude/` as a versioned copy under `~/.claude/plugins/cache/www/www/<version>/` and exposes `/www:write`. Codex installs `codex/plugin/` under `~/.codex/plugins/cache/www/www/<version>/` and exposes `$write`. The repository is the source; the installed copies are what run.

Reference files and the step each governs:

| Reference | Governs |
|---|---|
| `design-format.md` | the shape and rules of `design.md`, including the Progression and `Unfolds:` blocks as steps joined by named relations and the level each gives |
| `elicit.md` | questions, proposals in descending order of the chain, the three obligation lines before a proposal or question at `structure`, `plan` or `logic`, level recognition, contradictions |
| `decompose.md` | reading notes, outlines or pasted plans as material |
| `existing-manuscript.md` | starting from text the author wrote before the record existed |
| `writing-rules.md` | the sentence rules the drafting and restatement checks apply |
| `drafting.md` | drafting, revision, stale drafts, the style-source list |
| `review.md` | self-check (eight comparisons, the eighth the reading check), restatement check, independent check and the two categories of its findings, per-turn re-comparison, the record check on the Progression and part 2, hand edits |
| `types/<type>.md` | the rules of one document type (`presentation-script`, `research-paper`, `report`, `essay`), read with `writing-rules.md` when the record's type line names the type, winning over it on conflict |

`SKILL.md` names every reference; `scripts/check.sh` fails when a reference exists that `SKILL.md` does not name or when `SKILL.md` names one that does not exist.

## Files at run time

Per document, in the document folder (the directory the command runs in, or the path given as its argument):

- `design.md`: the record, the authority every check compares against.
- `draft.md`: the text, one heading per section.
- An existing manuscript, when present: read-only input.

Nothing is written outside the document folder. The rules that hold across documents are the plugin's own files, `references/writing-rules.md` and `references/types/<type>.md`, read from the installed copy and changed only through the repository.

## Flow of one turn

```
author's message
  → re-read design.md and draft.md in full
  → re-compare the working section against its draft; report a disagreement first
  → record check on the Progression and the working section's part 2 entry (shape and level); one line in the reply when something departs
  → infer the level (document-wide or per section) from the request and Status
  → one of:
      discussion: enumerate obligations → resolve from the record → at structure, plan or logic, three lines:
                  what the level obliges / what the record settles / what is asked or proposed now
                  → ask what survives / propose alternatives, the missing upper piece of the chain first
                    (Progression before any unfolding, unfolding before any logic, logic before any draft)
      recording:  accepted line → parts 1–4 of design.md → quoted back in the reply
                  → a line into the Progression or part 2: record check on the shape, result in one line;
                    a fault → open question in Status, descent waits
      drafting:   section's detailed logic + style sources (shipped rules file, type rules file, part 4) → draft text
                  → self-check (mapping, 8 comparisons; the 8th reads the section in order against the record)
                  → independent check (subagent) → category A findings applied, self-check rerun
                  → shown: each fix before and after, then the section; category B findings asked
      revision:   record updated first → touched sentences only → self-check
                  → a rule beyond this document: proposed in general words → on acceptance into part 4, shown as the line for the repository file
  → any explanation, summary or translation of the draft → restatement check against the record
```

The independent check is the one component that runs outside the main conversation: a fresh subagent started with the platform's own facility (Claude Code's Agent tool, Codex's spawn_agent) that receives only the section's Detailed logic entry, its Emphasis and wording entry and the draft text, and returns a list of mismatches. It never sees the conversation, so a drift the writer produced from the conversation is compared against the record alone. Its findings return to the main conversation, which sorts them: a finding the record already settles (category A) is applied to the draft and shown before and after; a finding whose fix would move the record (category B) is asked, and the record changes before the draft does.

## Data flow of meaning

Author's words (mostly Korean) → recorded as an English line with the author's words verbatim beside it → rendered as a sentence in the document's language → every check compares the sentence, and every restatement of it, with the recorded line, never with another sentence. The record is the single point the chain is anchored to; the verbatim words let the author see where the English line departed from what they said.

## Boundaries

- The plugin writes only `design.md` and `draft.md` in the document folder. It never writes into its own installed files, any other path, or a manuscript.
- A rule accepted at run time reaches other documents only through the repository: appended to `references/writing-rules.md` or a type rules file, the versions raised, the packages rebuilt and reinstalled.
- The repository's `tests/ads-introduction/` is a fixture, not part of either package; `scripts/build.sh` and `scripts/check.sh` are developer tools, not loaded by the skill.
- The author's Obsidian vault is not read at run time; the shipped rules file carries the author's writing rules on its own.
