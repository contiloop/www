# Contracts

What a user of the plugin, or a tool reading its files, can rely on.

## The command

`/www:write [path] [request in natural language]`

- Input: an optional folder path (the document folder; default: the current directory) and free text. There are no sub-commands and no required order of requests.
- Output: replies in the author's language that are one of three things: a question, a result (a recorded line quoted back, a proposal with alternatives, a draft with its check results, a finding), or a report of what blocks. Files written: `design.md` and `draft.md` in the document folder; `~/.claude/www/writing-rules.md` on the first accepted cross-document rule.
- Error cases: a folder with several text files and no `design.md` and no pointed-at file → the skill asks which is the manuscript before writing anything. A request that fits two levels → the skill asks which. A request to draft a section below level `logic` → two or three candidate logics are proposed; no draft is written.

## `design.md`

Markdown, English, five top-level parts in this order and with these headings: `## 1 Overview`, `## 2 Structure and section plans`, `## 3 Detailed logic`, `## 4 Emphasis and wording`, `## 5 Status`. Headings below them vary.

Detailed logic notation, per section:

```
C1 (role) <English line>
    author: <the author's words, verbatim>
  → C2 by <relation>, holds when <condition>
```

Role ∈ {need, cause, judgment, question, proposal, description}. Relation ∈ {cause, contrast, condition, consequence, question/answer}. The `author:` line is omitted when the author typed the English line. A replacing line carries `(replaces: <old line, shortened>)`.

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

A reader may edit any part by hand; the skill re-reads the whole file every turn and treats Status as hints.

## `draft.md`

Markdown in the document's language, one `##` heading per section in the order of part 2 of the record, prose under each. No claim markers or annotations. Text the author writes into it is preserved; a departure from the record becomes a question.

## `~/.claude/www/writing-rules.md`

Markdown. Rules the author accepted at run time, each in general words, appended in acceptance order. Read with the shipped `references/writing-rules.md`; a rule here wins on conflict. Created by the skill on the first accepted rule; safe to edit or delete by hand.

## `scripts/check.sh`

`sh scripts/check.sh` from any directory. Exit 0: all checks pass. Exit 1: at least one `FAIL` line (manifest, reference heading or body, frontmatter, reference cross-check). Exit 1 with a message: `python3` missing. Output: one `ok`, `FAIL` or `note` line per check, then `all checks passed` or `some checks failed`.

## `tests/ads-introduction/check.sh`

`sh check.sh <draft.md> <mapping.txt>`. Exit 0: six `ok` lines. Exit 1: at least one `FAIL` line (mapping coverage, a `none` sentence, an unmapped claim, claim-3 local term, claim-3 banned word, a sentence between claims 10 and 11). Exit 2: usage error or missing file or missing `python3`. Output begins with the numbered sentences the script derived, so the mapping can be checked against them. Mapping lines: `<sentence number> <claim numbers or none>`, claim numbers comma-separated when one sentence renders several; `#` lines and blank lines ignored.
