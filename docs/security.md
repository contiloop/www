# Security

The plugin runs inside Claude Code on the author's machine with the author's own permissions. There is no authentication, no network surface, no credential and no multi-user state. What is protected is the author's text and the author's authority over what the document says.

## Protected assets

- The author's manuscript files: never modified, renamed or moved; `draft.md` is the working copy.
- Text the author typed, in `design.md` or `draft.md`: never overwritten or reverted by a check. A departure from the record becomes a question (restore or change), not a fix.
- The agreed content of `design.md` parts 1 to 4: changed only on the author's acceptance, with a replacement note, quoted back in the reply that wrote it. Dependents of a changed line are asked about, never edited silently.
- The plugin's installed files: never written at run time. Rules accepted at run time go to `~/.claude/www/writing-rules.md`.

## Who may do what

| Subject | May | May not |
|---|---|---|
| the author | edit any file by hand at any time; accept, reject or decline anything | — |
| the skill (main conversation) | write `design.md`, `draft.md`, `~/.claude/www/writing-rules.md`; offer `git init` once in the document folder | write any other path; modify a manuscript; apply an independent-check finding without the author's word; write a rule into the plugin |
| the independent-check subagent | read the three inputs pasted into its prompt | edit anything; read any file; see the conversation |

## Data given to the subagent

The independent check receives only the section's Detailed logic entry, its Emphasis and wording entry and the draft text, pasted verbatim. The rest of the record and the conversation are withheld, so the reviewer compares against the authority alone and nothing else about the author's document leaves the main conversation.

## Audit

Every line written into parts 1 to 4 is quoted back in the same reply, so the conversation holds a complete trail of what entered the record and when. The skill offers once, at document start, to initialize git in the document folder so record and draft history is recoverable; the author may decline and the skill does not offer again. The reply that shows a draft names that the self-check ran and what it changed, and the independent check's dispatch and return are visible in the transcript, so a skipped check can be told from one that found nothing.

## Headless runs

Running the skill with `claude -p --dangerously-skip-permissions` (as the acceptance fixture does) removes the permission prompts for file writes and subagent dispatch inside the folder it runs in. Run it only in a fixture folder whose files are under version control and restore them afterwards.
