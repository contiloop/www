# Contracts

What a user of the plugin, or a tool reading its files, can rely on.

## The command

Claude Code: `/www:write [path] [request in natural language]`. Codex: `$write [path] [request in natural language]`. Same skill, same files, same behavior.

- Input: an optional folder path (the document folder; default: the current directory) and free text. There are no sub-commands and no required order of requests.
- Output: replies in the author's language that are one of three things: a question, a result (a recorded line quoted back, a proposal with alternatives, a draft with its check results and each applied fix before and after, a finding, an accepted rule shown as the line for the repository's rules file), or a report of what blocks. Files written: `design.md` and `draft.md` in the document folder, nothing else.
- Error cases: a folder with several text files and no `design.md` and no pointed-at file → the skill asks which is the manuscript before writing anything. A request that fits two levels → the skill asks which. A request that lands below the chain (a draft of a section with no Detailed logic entry, a logic for a section with no `Unfolds:` block, an unfolding while the Progression is empty) → the missing upper piece is proposed in two or three alternatives, nearest the top first; no draft is written.

## `design.md`

Markdown, English, five top-level parts in this order and with these headings: `## 1 Overview`, `## 2 Structure and section plans`, `## 3 Detailed logic`, `## 4 Emphasis and wording`, `## 5 Status`. Headings below them vary.

Progression notation, in part 1, and section plan notation, in part 2:

```
- Progression:
    <first step>
    → by <relation> <next step>
    → (declined) <next step>

1. <Section> — <what it covers>
    Unfolds:
    <first step>
    → by <relation> <next step>
```

The first step of a block is bare; every later step begins `→ by <relation> ` with a relation from the set below, or `→ (declined) ` when the author declined to name the join (that boundary is drafted with no connective; in part 3 the line between the two claims reads `→ C<n> (declined)`). A Progression step is claim-sized and may span sections; a section may have no step of its own. An `Unfolds:` step groups the claims the section's part 3 entry details, and the relation at a step boundary is written again in part 3 between the two claims. The join from one section to the next is written in the Progression only. A line of arrows without relations, or a list of topics, is neither a Progression nor an unfolding.

Detailed logic notation, per section:

```
C1 (role) <English line>
    author: <the author's words, verbatim>
  → C2 by <relation>, holds when <condition>
```

Role ∈ {need, cause, judgment, question, proposal, description}. Relation ∈ {cause, contrast, condition, consequence, question/answer, elaboration}. The `author:` line is omitted when the author typed the English line. A replacing line carries `(replaces: <old line, shortened>)`.

Status fields:

```
document: type <agreed|open>, reader-and-topic <agreed|open>, structure <agreed|open>
sections:
  <section>: level <none|plan|logic|wording>, draft <none|drafted|stale>
last worked on: <section or none>
open questions:
  - <question, where it lands, what goes wrong while open>[ — declined]
proposals:
  - <what, for which part and section>, alternatives: <A> / <B> / <C>, recommended <one>
```

A line the skill supplied inside a proposal is held as its own `proposals` entry until accepted on its own: `- <section>, <claim>, line the skill supplied: <line>, alternatives: enter the record / leave out, recommended <one>`.

Level semantics: `structure agreed` requires the Progression in the shape above and what every ordered section covers; a section is `plan` when its part 2 entry has both what it covers and an `Unfolds:` block, `none` when it has what it covers alone, `logic` when its part 3 entry exists; `wording` stays what the author has accepted. A Status value the body does not support is corrected at the next turn and the correction named. A shape fault in the Progression or a part 2 entry is listed under `open questions` with what cannot be proposed while it is open; the faulty line itself is left as written.

A reader may edit any part by hand; the skill re-reads the whole file every turn and treats Status as hints.

## `draft.md`

Markdown in the document's language, one `##` heading per section in the order of part 2 of the record, prose under each. No claim markers or annotations. Text the author writes into it is preserved; a departure from the record becomes a question.

## `references/types/<type>.md`

One rules file per document type of the set `presentation script | research paper | report | essay`: `presentation-script.md`, `research-paper.md`, `report.md`, `essay.md`; `other` has no file. Markdown, English, one top-level heading, an opening paragraph, then numbered rules in the form of `references/writing-rules.md`, each naming the level it applies at (structure and section plans, a section's logic, or the sentences of the draft): number, rule, test, disposition (cut, rewrite, ask the author). Read with `references/writing-rules.md` for every draft, revision and restatement once the record's type line names the type, and named in the reply that quotes the type line back; where a rule here conflicts with one in `writing-rules.md`, the type rule wins. The file changes only through the repository: a line appended at the end, the three manifest versions raised, the packages rebuilt and reinstalled. Rules the author accepts while writing live in that document's `design.md` part 4 until then.

## `scripts/build.sh`

`sh scripts/build.sh` from any directory. Reads `src/skills/write/` and `platform/`; writes `claude/` and `codex/plugin/` at the repository root, replacing them whole; with the environment variable `OUT_DIR` set, writes `$OUT_DIR/claude` and `$OUT_DIR/codex/plugin` instead and leaves the repository untouched. Exit 0 with the lines `built claude/`, `built codex/plugin/`, `build ok`. Exit non-zero, outputs untouched, when the three `platform/` manifest versions differ, when the source `SKILL.md` carries a platform key, or when an injected line did not land. Idempotent.

## `scripts/check.sh`

`sh scripts/check.sh` from any directory. Exit 0: all checks pass. Exit 1: at least one `FAIL` line (marketplace manifests, platform manifest versions, source reference heading or body, source frontmatter, reference cross-naming, `openai.yaml`, a package differing from a fresh build, injected lines missing or leaked). Exit 1 with a message: `python3` missing. Output: one `ok` or `FAIL` line per check, then `all checks passed` or `some checks failed`.

## Codex manifests

`.agents/plugins/marketplace.json`: marketplace `www`, one plugin `www` with `source.source: local`, `source.path: ./codex/plugin`, `policy.installation: AVAILABLE`. `codex/plugin/plugin.json`: Agent Plugins 1.0 form (`$schema`, `name`, `version`, `extensions.com.openai.interface`). `codex/plugin/.codex-plugin/plugin.json`: the `.codex-plugin` form with `skills: ./skills/` and a top-level `interface`. `codex/plugin/skills/write/agents/openai.yaml`: display strings and `policy.allow_implicit_invocation: false`. Display strings are free to change; the version, the name `www` and the skill path are not.

## `tests/ads-introduction/check.sh`

`sh check.sh <draft.md> <mapping.txt>`. Exit 0: six `ok` lines. Exit 1: at least one `FAIL` line (mapping coverage, a `none` sentence, an unmapped claim, claim-3 local term, claim-3 banned word, a sentence between claims 10 and 11). Exit 2: usage error or missing file or missing `python3`. Output begins with the numbered sentences the script derived, so the mapping can be checked against them. Mapping lines: `<sentence number> <claim numbers or none>`, claim numbers comma-separated when one sentence renders several; `#` lines and blank lines ignored.
