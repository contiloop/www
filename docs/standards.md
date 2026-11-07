# Standards

Rules whose violation breaks the plugin, the acceptance test or the author's trust in the record. Each has a violation criterion.

## Repository and plugin structure

- The marketplace manifest `.claude-plugin/marketplace.json` lists exactly one plugin, `www`, with source `./claude`; `claude/.claude-plugin/plugin.json` names `www`. Violation: `scripts/check.sh` fails on its first two checks.
- The skill's frontmatter has `name: write`, `disable-model-invocation: true`, and `allowed-tools: Read, Edit, Write, Bash, Grep, Glob, Agent, AskUserQuestion`. Violation: the structure check fails or the skill cannot dispatch the independent check.
- Every file in `claude/skills/write/references/` is named by `SKILL.md` by the path `references/<name>.md`, and every such path named in `SKILL.md` exists. Violation: `scripts/check.sh` exits non-zero.
- Every reference file starts with one top-level heading on line 1 and has a non-empty body. Violation: `scripts/check.sh` exits non-zero.
- `scripts/check.sh` exits 0 before any commit that touches `claude/`. Violation: a broken plugin is installed on the next `claude plugin install`.
- `claude plugin validate .` passes before a release.

## Writing rules for the skill's own files

All skill files are documents an AI reads. Each sentence must pass: it is not something the agent would do without being told; a reader who reads it and one who does not would work differently; it carries a fact specific to this plugin; something breaks if it is absent. Violation criterion: a sentence that fails any of the four is removed in review.

- English throughout the skill files, the record and this documentation.
- "Never" or "do not" appears only where the reader would otherwise do the thing.
- A rule is worded as a general rule, not as the case that taught it; an example, when one is needed, comes from a domain other than the one the rule was learned from, or two unlike examples are given.
- No announcing sentences, no hedges that protect the writer, no closing summaries.
- No hardcoded question lists, section templates or document-type checklists anywhere in the skill. Method and floors only. Violation: a numbered or bulleted list of literal questions, or a per-type section list, in any skill file.
- No process vocabulary borrowed from other tools as mechanism names in any skill file (the words harness, 3-doc, gate, wave, lens, grounding, delta are the checked list).

## Vocabulary

The skill files use one vocabulary; a synonym for any of these in a skill file is a defect: the author; the record (`design.md`); the draft (`draft.md`); the document folder; proposal; accepted / rejected; stale; claim; relation; condition; emphasis and wording notes; the shipped rules file (`references/writing-rules.md`); the user rules file (`~/.claude/www/writing-rules.md`); restatement (an explanation, summary or translation of a draft).

Fixed value sets, spelled exactly:
- document-wide levels: `type`, `reader-and-topic`, `structure`, each `agreed` or `open`
- per-section level: `none | plan | logic | wording`
- draft state: `none | drafted | stale`
- claim roles: need, cause, judgment, question, proposal, description
- relation kinds: cause, contrast, condition, consequence, question/answer

## File ownership inside the skill

Each reference owns its topic and is the only place that states its tests; other files refer to it by path rather than restating. The style-source list exists once, in `references/drafting.md`. The user rules file path appears in `SKILL.md`, `drafting.md`, `writing-rules.md` and `elicit.md` only as a path, with its rules stated in `writing-rules.md`.

## Run-time write boundary

The skill writes `design.md`, `draft.md` and `~/.claude/www/writing-rules.md`, nothing else. Violation: any write into the plugin's installed folder, a manuscript file, or another path.

## Verification before a change to the skill is kept

1. `sh scripts/check.sh` exits 0.
2. The acceptance fixture passes: `tests/ads-introduction/RUN.md` steps, `check.sh` exit 0 on the saved draft and mapping, and every judged condition recorded as pass in `results/RESULT.md`.
3. A change that touches questioning behavior is tried live on a real document before release; the fixture does not exercise the questioning half.

## Commits

The repository's commits end with the line `Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>` when an AI agent authored the change. Paths listed in `.gitignore` are never committed; working folders of planning tools stay out of the tree.
