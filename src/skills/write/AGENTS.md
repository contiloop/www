# write skill

## Scope

This folder is the skill's source: `SKILL.md` (the entry file, the only one loaded at start) and `references/` (seven files, each loaded at the step it governs, and `types/`, one rules file per document type). Everything the agent does under `/www:write` (Claude Code) or `$write` (Codex) is specified here. `scripts/build.sh` copies this folder, minus this notes file, into `claude/skills/write/` and `codex/plugin/skills/write/`; those copies are never edited. The folder owns the record format, the questioning method, the manuscript path, the writing rules, drafting, the checks, and the type rules files.

Not this folder's scope: the manifests and overlays (`platform/`, `.claude-plugin/`, `.agents/`), the build and structure check (`scripts/`), the generated packages (`claude/`, `codex/`), the acceptance fixture (`tests/`), and the author's run-time files (`design.md` and `draft.md` in document folders), which the skill writes but which are not part of the plugin.

## Boundaries

- `SKILL.md` routes; it does not restate a reference's rules. A rule's test lives in exactly one reference.
- `references/drafting.md` is the only file that lists the style sources (shipped rules file, the type rules file, the document's emphasis and wording notes). A new style source is added there and nowhere else.
- `references/writing-rules.md` is the only file that states sentence-level tests. Other files refer to it by path and by rule number.
- `references/types/<type>.md` holds the rules of one document type, in the numbered form of `writing-rules.md`; a file exists for each type of the fixed set except `other`. A rule is added there in the repository on the author's word, never at run time.
- Nothing in this folder is written at run time. A rule the author accepts while writing goes into that document's record, and the line for the repository is shown to the author.
- Do not add a file to `references/` without naming it in `SKILL.md` by `references/<name>.md`; `scripts/check.sh` fails otherwise. After any edit here, run `sh scripts/build.sh` and commit the regenerated packages, or the check fails on staleness.
- The text names no platform: no command, no tool name. It says "the command", "the platform's subagent facility", "the platform's structured question tool when it has one, otherwise plain text".

## Invariants (each is checkable by reading the files)

- Every file is English, starts with one top-level heading (`SKILL.md`: frontmatter first, then the heading), and contains no list of literal questions to ask, no document-type template, and none of the words harness, 3-doc, gate, wave, lens, grounding, delta as mechanism names.
- The vocabulary is fixed: the author; the record (`design.md`); the draft (`draft.md`); the document folder; proposal; accepted / rejected; stale; claim; relation; condition; emphasis and wording notes; the shipped rules file; the type rules file; restatement; content remark; understanding remark; category A / category B finding; Progression; unfolding; step; join; declined join; record check. Value sets: levels `type`, `reader-and-topic`, `structure` (document-wide) and `none | plan | logic | wording` (per section); draft state `none | drafted | stale`; roles need, cause, judgment, question, proposal, description; relations cause, contrast, condition, consequence, question/answer; document type `presentation script | research paper | report | essay | other`, each but `other` with a file under `references/types/`.
- The shape of the Progression (the line `- Progression:`, one step per line, the first bare, each later step beginning `→ by <relation> ` or `→ (declined) `), the `Unfolds:` block of a section plan in the same shape, and the part 3 line `→ C<n> (declined)` at a declined join are a contract: `tests/ads-introduction/design.md` and `docs/contracts.md` depend on them, and a change to any of them in `references/design-format.md` changes both.
- The fourteen rules under "Rules held without opening a reference" in `SKILL.md` each have their full statement in a reference; a rule stated only in `SKILL.md` is a defect.
- Frontmatter in this source: `name: write` and `description` only. The build inserts `disable-model-invocation: true` and `allowed-tools: Read, Edit, Write, Bash, Grep, Glob, Agent, AskUserQuestion` into the Claude copy (the Agent tool is required by the independent check, AskUserQuestion by structured questions) and adds `agents/openai.yaml` with `allow_implicit_invocation: false` to the Codex copy.

## Patterns

- Each reference opens by saying what it governs and against what authority (the record), then gives method and floors, then the dispositions. A reference never scripts the conversation.
- A rule in `references/writing-rules.md` is numbered and carries its test and its disposition (cut, rewrite, ask the author). Add new rules at the end of the group they belong to; other files cite rule numbers (1, 2, 18, 26, 27, 30, 33, 34 are cited), so do not renumber.
- Examples in any file come from a domain other than machine translation or NLP papers; the author's own case taught the rules and must not become their only illustration.
- Cross-file pointers are written as the path `references/<name>.md`, never as a prose name alone.

## Test guidance

- `sh scripts/build.sh && sh scripts/check.sh` after any edit (heading, body, frontmatter, cross-naming, both packages equal to a fresh build).
- A change to `drafting.md`, `review.md` or `writing-rules.md` is tried on the acceptance fixture (`tests/ads-introduction/RUN.md`) on both platforms: the draft must still keep claim 3 as a need with the local condition, insert nothing between claims 10 and 11, add no sentence without a claim, and the Korean explanation must add no claim.
- A change to `elicit.md`, `decompose.md`, `existing-manuscript.md` or the entry behavior in `SKILL.md` is tried live on a real document, because the fixture pre-answers the questioning half.
- A change to the category handling of findings in `review.md`, or a rule added to a type rules file, is tried live: the fixture's record is settled enough that a category B finding is unlikely, and its type (a research paper) exercises one type file only.
- A change to the descent rule in `elicit.md` or to the record check in `review.md` is tried live: the fixture's record is complete above the Introduction (a Progression with named relations, an `Unfolds:` block for the section), so a headless run never proposes a missing upper chain and never raises a shape question.
- Edge cases worth exercising by hand: a `design.md` edited by hand so Status disagrees with the body; a hand-edited sentence in `draft.md`; a request to draft a section at level `plan`; a request for a section's logic while the Progression is absent; a Progression the author typed as one line of arrows with no relation named; a correction that changes a claim other sections rest on; a folder with two text files and no record.
