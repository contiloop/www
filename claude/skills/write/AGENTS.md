# write skill

## Scope

This folder is the whole skill: `SKILL.md` (the entry file, the only one loaded at start) and `references/` (seven files, each loaded at the step it governs). Everything the agent does under `/www:write` is specified here. The folder owns the record format, the questioning method, the manuscript path, the writing rules, drafting, and the checks.

Not this folder's scope: the plugin manifests (`claude/.claude-plugin/`, `.claude-plugin/`), the structure check (`scripts/`), the acceptance fixture (`tests/`), and the author's run-time files (`design.md`, `draft.md` in document folders; `~/.claude/www/writing-rules.md`), which the skill writes but which are not part of the plugin.

## Boundaries

- `SKILL.md` routes; it does not restate a reference's rules. A rule's test lives in exactly one reference.
- `references/drafting.md` is the only file that lists the style sources (shipped rules file, user rules file, the document's emphasis and wording notes). A new style source is added there and nowhere else.
- `references/writing-rules.md` is the only file that states sentence-level tests. Other files refer to it by path and by rule number.
- Nothing in this folder is written at run time. Run-time rules go to the user rules file.
- Do not add a file to `references/` without naming it in `SKILL.md` by `references/<name>.md`; `scripts/check.sh` fails otherwise.

## Invariants (each is checkable by reading the files)

- Every file is English, starts with one top-level heading (`SKILL.md`: frontmatter first, then the heading), and contains no list of literal questions to ask, no document-type template, and none of the words harness, 3-doc, gate, wave, lens, grounding, delta as mechanism names.
- The vocabulary is fixed: the author; the record (`design.md`); the draft (`draft.md`); the document folder; proposal; accepted / rejected; stale; claim; relation; condition; emphasis and wording notes; the shipped rules file; the user rules file; restatement. Value sets: levels `type`, `reader-and-topic`, `structure` (document-wide) and `none | plan | logic | wording` (per section); draft state `none | drafted | stale`; roles need, cause, judgment, question, proposal, description; relations cause, contrast, condition, consequence, question/answer.
- The ten rules under "Rules held without opening a reference" in `SKILL.md` each have their full statement in a reference; a rule stated only in `SKILL.md` is a defect.
- Frontmatter: `name: write`, `disable-model-invocation: true`, `allowed-tools: Read, Edit, Write, Bash, Grep, Glob, Agent, AskUserQuestion` (the Agent tool is required by the independent check, AskUserQuestion by structured questions).

## Patterns

- Each reference opens by saying what it governs and against what authority (the record), then gives method and floors, then the dispositions. A reference never scripts the conversation.
- A rule in `references/writing-rules.md` is numbered and carries its test and its disposition (cut, rewrite, ask the author). Add new rules at the end of the group they belong to; other files cite rule numbers (26, 27, 30 are cited), so do not renumber.
- Examples in any file come from a domain other than machine translation or NLP papers; the author's own case taught the rules and must not become their only illustration.
- Cross-file pointers are written as the path `references/<name>.md`, never as a prose name alone.

## Test guidance

- `sh scripts/check.sh` after any edit (heading, body, frontmatter, cross-naming).
- A change to `drafting.md`, `review.md` or `writing-rules.md` is tried on the acceptance fixture (`tests/ads-introduction/RUN.md`): the draft must still keep claim 3 as a need with the local condition, insert nothing between claims 10 and 11, add no sentence without a claim, and the Korean explanation must add no claim.
- A change to `elicit.md`, `decompose.md`, `existing-manuscript.md` or the entry behavior in `SKILL.md` is tried live on a real document, because the fixture pre-answers the questioning half.
- Edge cases worth exercising by hand: a `design.md` edited by hand so Status disagrees with the body; a hand-edited sentence in `draft.md`; a request to draft a section at level `plan`; a correction that changes a claim other sections rest on; a folder with two text files and no record.
