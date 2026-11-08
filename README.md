# www: I Know How to Write

A plugin for Claude Code and Codex with one skill, `write`. It works out a document with its author: the type, the reader, the message, the structure, each section's claim-by-claim logic and the wording are settled through questions and proposals, what is agreed is recorded in `design.md`, and `draft.md` is written so the text says exactly what was agreed. Claims keep their role and strength, conditions are not dropped, nothing is inserted between two agreed steps, no caveats or takeaways appear that the author did not ask for, and a correction is not made twice.

## Install

Claude Code:

```bash
claude plugin marketplace add contiloop/www
```

```bash
claude plugin install www@www
```

Codex:

```bash
codex plugin marketplace add contiloop/www
```

```bash
codex plugin add www@www
```

From a local clone, give the folder path instead of `contiloop/www`. The same commands reinstall the plugin on a new machine. The command is `/www:write` in Claude Code and `$write` in Codex.

Both packages, `claude/` and `codex/plugin/`, are generated from the one skill source in `src/skills/write/` by `scripts/build.sh` and are not edited by hand.

## Use

Open a Claude Code or Codex session in the folder of the document you are writing and run the command, followed by what you want in your own words ("I want to write a research paper", "let's plan the structure", "go through the Introduction claim by claim", "draft the Introduction", "the third paragraph's emphasis is wrong"). There are no sub-commands. You can move between the document's overall design and a single sentence at any time.

Files, per document, in the document folder:

- `design.md`: the agreed design. Five parts: overview, structure and section plans, detailed logic per section, emphasis and wording per section, status. Written in English with your own words kept verbatim beside each line. You may edit it by hand; the skill re-reads it every turn.
- `draft.md`: the text, one heading per section, in the document's language.
- An existing manuscript in the folder is read, never modified; `draft.md` becomes the working copy.

The writing rules are the plugin's own files: `src/skills/write/references/writing-rules.md` for every document and one file per document type under `src/skills/write/references/types/` (`presentation-script.md`, `research-paper.md`, `report.md`, `essay.md`), read with it and winning on conflict. A rule you accept while writing is recorded in that document's `design.md` and shown as the line to add to one of these files; to carry it to later documents, append the line there, raise the version in the three `platform/` manifests, run `sh scripts/build.sh && sh scripts/check.sh`, commit, and reinstall.

## Check the plugin

```bash
sh scripts/check.sh
```

Verifies the manifests, the skill source's frontmatter, that every reference file is named by the skill, and that both generated packages match a fresh build.

## Acceptance test

`tests/ads-introduction/` holds a prefilled `design.md` for a paper's Introduction, `RUN.md` with the steps, and `check.sh` for the mechanical conditions. Follow `RUN.md`; it ends with a draft, a Korean explanation of it, a sentence-to-claim mapping and a result file under `tests/ads-introduction/results/`.
