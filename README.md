# www: I Know How to Write

A Claude Code plugin with one skill, `/www:write`. It works out a document with its author: the type, the reader, the message, the structure, each section's claim-by-claim logic and the wording are settled through questions and proposals, what is agreed is recorded in `design.md`, and `draft.md` is written so the text says exactly what was agreed. Claims keep their role and strength, conditions are not dropped, nothing is inserted between two agreed steps, no caveats or takeaways appear that the author did not ask for, and a correction is not made twice.

## Install

```bash
claude plugin marketplace add /path/to/www
```

```bash
claude plugin install www@www
```

From GitHub, replace the path with the repository URL. The same two commands reinstall the plugin on a new machine; nothing else is needed. The marketplace manifest is `.claude-plugin/marketplace.json`; the plugin itself is the `claude/` folder.

## Use

Open a Claude Code session in the folder of the document you are writing and run `/www:write`, followed by what you want in your own words ("I want to write a research paper", "let's plan the structure", "go through the Introduction claim by claim", "draft the Introduction", "the third paragraph's emphasis is wrong"). There are no sub-commands. You can move between the document's overall design and a single sentence at any time.

Files, per document, in the document folder:

- `design.md`: the agreed design. Five parts: overview, structure and section plans, detailed logic per section, emphasis and wording per section, status. Written in English with your own words kept verbatim beside each line. You may edit it by hand; the skill re-reads it every turn.
- `draft.md`: the text, one heading per section, in the document's language.
- An existing manuscript in the folder is read, never modified; `draft.md` becomes the working copy.

One file per user, created on the first rule you accept: `~/.claude/www/writing-rules.md`, the writing rules that carry over to later documents. It is read with the plugin's shipped rules in `claude/skills/write/references/writing-rules.md` and wins on conflict.

## Check the plugin

```bash
sh scripts/check.sh
```

Verifies the manifests, the skill's frontmatter and that every reference file is named by the skill.

## Acceptance test

`tests/ads-introduction/` holds a prefilled `design.md` for a paper's Introduction, `RUN.md` with the steps, and `check.sh` for the mechanical conditions. Follow `RUN.md`; it ends with a draft, a Korean explanation of it, a sentence-to-claim mapping and a result file under `tests/ads-introduction/results/`.
