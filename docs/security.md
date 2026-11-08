# Security

The plugin runs inside Claude Code or Codex on the author's machine with the author's own permissions. There is no authentication, no network surface, no credential and no multi-user state. What is protected is the author's text and the author's authority over what the document says.

## Protected assets

- The author's manuscript files: never modified, renamed or moved; `draft.md` is the working copy.
- Text the author typed, in `design.md` or `draft.md`: never overwritten or reverted by a check or by an applied finding. A departure from the record becomes a question (restore or change), not a fix.
- The agreed content of `design.md` parts 1 to 4: changed only on the author's acceptance, with a replacement note, quoted back in the reply that wrote it. Dependents of a changed line are asked about, never edited silently.
- The plugin's installed files: never written at run time. A rule the author accepts while writing is recorded in that document's `design.md` and shown as the line for the repository's `writing-rules.md` or type rules file; it reaches the plugin only through a repository edit and a release.

## Who may do what

| Subject | May | May not |
|---|---|---|
| the author | edit any file by hand at any time; accept, reject or decline anything | — |
| the skill (main conversation) | write `design.md` and `draft.md` in the document folder; apply a category A finding (the record stands, the draft moves toward it) and show it before and after; offer `git init` once in the document folder | write any other path; modify a manuscript; apply a category B finding (one that would move the record) without the author's word; apply any finding to text the author typed; write a rule into the plugin's files |
| the independent-check subagent | read the three inputs pasted into its prompt | edit anything; read any file; see the conversation |

## Data given to the subagent

The independent check receives only the section's Detailed logic entry, its Emphasis and wording entry and the draft text, pasted verbatim. The rest of the record and the conversation are withheld, so the reviewer compares against the authority alone and nothing else about the author's document leaves the main conversation.

## Audit

Every line written into parts 1 to 4 is quoted back in the same reply, so the conversation holds a complete trail of what entered the record and when. The skill offers once, at document start, to initialize git in the document folder so record and draft history is recoverable; the author may decline and the skill does not offer again. The reply that shows a draft names that the self-check ran and what it changed, and the independent check's dispatch and return are visible in the transcript, so a skipped check can be told from one that found nothing. Each category A finding applied without the author's word is shown as the sentence before and after with its reason, so the transcript holds every change a check made to the draft. A rule the author accepts is quoted back as a part 4 line and shown as the line for the repository file, so the transcript holds both the rule and where it is meant to go.

## Codex sandbox

Codex's default sandbox (`workspace-write`) suffices: the skill writes only `design.md` and `draft.md`, both in the document folder. The independent check needs Codex's multi-agent feature; without it the skill reports that the check could not run.

## Headless runs

Running the skill with `claude -p --dangerously-skip-permissions` or `codex exec --dangerously-bypass-approvals-and-sandbox` (as the acceptance fixture does) removes the permission prompts for file writes and subagent dispatch. Run it only in a fixture folder whose files are under version control and restore them afterwards.
