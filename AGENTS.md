# www: I Know How to Write

A Claude Code plugin for one author, with one skill, `/www:write`: it settles a document's type, reader, message, structure, claim-by-claim logic and wording with the author through questions and proposals, records what is agreed in `design.md` in the document's folder, and drafts `draft.md` so the text says exactly what was agreed. Markdown instructions and two shell scripts; no server, no database, no network.

## Project structure

```
www/
├── CLAUDE.md                          ← this file (AGENTS.md is identical)
├── AGENTS.md
├── README.md                          ← install, use, check, acceptance test
├── .claude-plugin/marketplace.json    ← marketplace "www", one plugin, source ./claude
├── claude/
│   ├── .claude-plugin/plugin.json     ← plugin "www"
│   └── skills/write/
│       ├── AGENTS.md                  ← the skill folder: scope, boundaries, invariants, tests
│       ├── SKILL.md                   ← entry file; routes to the references
│       └── references/
│           ├── design-format.md       ← the record: five parts, Status, acceptance, verbatim words
│           ├── elicit.md              ← questions (three grounds), proposals, levels, contradictions
│           ├── decompose.md           ← reading notes and outlines as material
│           ├── existing-manuscript.md ← starting from text written before the record
│           ├── writing-rules.md       ← the 34 sentence rules the checks apply
│           ├── drafting.md            ← drafting, revision, stale drafts, the style-source list
│           └── review.md              ← self-check, restatement check, independent check, hand edits
├── scripts/check.sh                   ← structure check of the plugin (exit 0 = sound)
├── tests/ads-introduction/            ← acceptance fixture: design.md, RUN.md, check.sh, results/
└── docs/
    ├── architecture.md                ← components, files at run time, flow of a turn
    ├── business-rules.md              ← the rules the skill holds, each testable
    ├── security.md                    ← protected assets, who may write what, audit trail
    ├── standards.md                   ← structure, writing and vocabulary rules; verification before a change
    ├── engineering-notes.md           ← traps: installed snapshot, headless runs, fixture restore
    ├── operations.md                  ← install, update, check, run the acceptance test
    ├── contracts.md                   ← the command, design.md, draft.md, rules file, script interfaces
    └── tracking/
        ├── status.md                  ← done, built-not-verified, remaining
        ├── decisions/                 ← seven decision records and their index
        └── findings.md                ← open problems and why they wait
```

## Hard gates

- Nothing enters parts 1 to 4 of a `design.md` without the author's acceptance, and every written line is quoted back in the reply that wrote it with the author's words verbatim beside the English line.
- Text the author typed, in `design.md` or `draft.md`, is never overwritten; a departure from the record is a question, not a fix. Dependents of a changed line are asked about, never edited silently.
- Every sentence drafted answers to a recorded claim, relation or accepted addition, with its role, strength and conditions kept; findings of the independent check change the draft only on the author's word.
- The skill writes only `design.md`, `draft.md` and `~/.claude/www/writing-rules.md`; nothing into its own installed files.
- Skill files are English, dense, general rules with no question lists or document-type templates; `scripts/check.sh` exits 0 before any commit under `claude/`. The full rules are in `docs/standards.md`.

## Before working

Read `docs/standards.md`, `docs/engineering-notes.md` and `claude/skills/write/AGENTS.md`. Then, by kind of work:

- Changing how the record is written or read: `claude/skills/write/references/design-format.md` first; the Status value sets and the claim notation are a contract that `tests/ads-introduction/design.md` and `docs/contracts.md` depend on.
- Changing drafting or checks: `references/drafting.md` and `references/review.md`, then rerun the acceptance fixture per `tests/ads-introduction/RUN.md`; `writing-rules.md` rule numbers 26, 27 and 30 are cited elsewhere, so do not renumber.
- Changing questioning: `references/elicit.md`; the fixture does not exercise it, so try the change live on a real document.
- Adding a style source (the planned reference-sentence collection): the list in `references/drafting.md`, nowhere else.
- Editing anything under `claude/`: the installed plugin is a snapshot; update it as `docs/operations.md` describes before testing.

## When something goes wrong

Report to the author at once: the skill wrote into a manuscript, overwrote text the author typed, wrote into its own installed files, or put a line into parts 1 to 4 that the author did not accept. These break the author's authority over the document and are never worked around. Everything else goes into `docs/tracking/findings.md` with why it cannot be solved now.
