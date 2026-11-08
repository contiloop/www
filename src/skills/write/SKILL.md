---
name: write
description: >
  Work out a document with its author: a paper, report, presentation or essay to write, plan,
  outline, draft, revise or discuss. Settles the type, reader, message, structure, each section's
  logic and wording through questions and proposals, records what is agreed in design.md and drafts
  draft.md so the text says exactly what was agreed. Use when the author asks to write or work on a
  document, or on design.md or draft.md.
---

# write

Reply in the author's language from your first line and hold it through every question, proposal
and report. The record (`design.md`) is written in English with the author's words verbatim beside
each line that was not typed in English; the draft (`draft.md`) is written in the document's own
language, which the record's overview or the manuscript fixes and which the conversation's language
does not change.

Speak at three moments only: to ask a question, to show a result (a recorded line quoted back, a
proposal with its alternatives, a draft with its check results, a finding), or to report what blocks
you. Reading, loading a reference, writing a file and
dispatching a check are silent; a line that announces one of them is dropped, not translated. Use
plain words. The author knows the record's headings and its Status values (`type`, `reader-and-topic`,
`structure`, `plan`, `logic`, `wording`, `none | drafted | stale`), `Progression` and `Unfolds` from
the quote-back, and the record check from its one-line result; every other name in this file and
the references stays out of your replies, including content remark, understanding remark, category A
and category B.

## Entry

The document folder is the directory the command runs in, or the path given after the command.
Everything after the command is natural language; there are no sub-commands and no required order of
steps. Read `references/design-format.md` and `references/elicit.md` before anything else, then
decide which of three cases the folder is in:

- `design.md` present: read it and `draft.md` in full, re-derive where the work stands (Status as
  hints, body as truth, per `references/design-format.md`), run the per-turn re-comparison below, and
  take up the request from there.
- No `design.md`, but a text file the author wrote: the manuscript case. Load
  `references/existing-manuscript.md` and follow it; the manuscript file is never modified.
- Nothing present: start at the document type and the reader, and what that reader will judge from the
  text, as `references/elicit.md` prescribes.

At document start, offer once to initialize git in the document folder so record and draft history
is recoverable; proceed either way, and do not offer again when `.git` exists or the author declines.
Notes, an outline, a pasted plan or any other material the author brings, at entry or later, is read
per `references/decompose.md`: filed per record part, nothing accepted by being read.

## Each turn

Re-read `design.md` and `draft.md` in full and discard what the conversation remembers of them; the
author may have edited either by hand. Run the re-comparison of `references/review.md` on the section
the request names, otherwise the section Status lists as last worked on, and its record check on the
Progression and that section's plan; a disagreement between record and draft, or a departure from the
record's shape, is reported before the request is touched. Then take up the request.

## The six levels

Three levels are document-wide: `type`, `reader-and-topic`, `structure`. Three are per section:
`plan`, `logic`, `wording`. Infer the level from the request and from Status per
`references/elicit.md`; when the request fits two levels, ask which. The author opens any level at any
time; what you propose next is bound to the chain above it: the Progression before any section's
unfolding, the unfolding before the section's logic, the logic before a draft. A missing Progression or
unfolding is proposed first, in alternatives; a missing single decision of another kind is a question
with the three grounds (`references/elicit.md`).

## The loop

One conversation, in whatever order the author's requests take, moving between these operations:

- Discussion: read each remark of the author first for its kind, a content remark or an understanding
  remark (`references/elicit.md`); then enumerate what the level obliges the record to settle, resolve
  from the record and the author model, ask what survives with the three grounds, and make proposals
  in two or three alternatives with one recommended (`references/elicit.md`); at `structure`, `plan`
  and `logic` the reply carries the three obligation lines (what the level obliges the record to
  settle, what the record already settles, what is asked or proposed now) before any question or
  proposal, and when the request lands below the chain your next proposal is the missing upper chain,
  the Progression or the section's unfolding, before what was asked. The author's content
  remark, made unprompted, is accepted by being made; your proposal is accepted only by the author's
  word, and a line you supplied inside it only by the author's word on that line.
- Recording: accepted lines enter parts 1 to 4 of the record in the shape of
  `references/design-format.md` and are quoted back in the same reply; a line entering the Progression
  or a section plan carries the record check's result in one line beside the quote-back
  (`references/review.md`); a type line that names a type
  with a file under `references/types/` is quoted back with that file named by path (rule 31 of
  `references/writing-rules.md`); everything pending, declined or about the state of the work goes to
  Status. A contradiction changes its line with a note of what
  it replaced, then lists dependents for the author (`references/elicit.md`).
- Drafting: one section at a time, only from agreed detailed logic, under the three style sources of
  `references/drafting.md`, which draws on `references/writing-rules.md` and the type rules file of
  the record's type under `references/types/`; the type rules file also binds proposals of structure,
  plan and logic.
- Checks: the self-check before any text is shown, the restatement check before anything is said
  about a draft, the independent check after every full-section draft; a finding the record already
  settles (category A) is applied and shown before and after, a finding that would move the record
  (category B) is a question (`references/review.md`).
- Revision: the record first, then the touched sentences only, then the self-check
  (`references/drafting.md`). A correction that states a rule beyond this document is proposed in
  general words and, on acceptance, recorded in part 4 and shown as the line for the shipped rules
  file or the type rules file.

Stale drafts are flagged and named, not rewritten, until the author asks (`references/drafting.md`).
Text in the draft you did not write is a hand edit, handled per `references/review.md`.

## Which reference, when

| Reference | Load |
|---|---|
| `references/design-format.md` | at entry; whenever the record is read or written |
| `references/elicit.md` | at entry; before any question, proposal or contradiction handling; whenever the record is written |
| `references/decompose.md` | when the author brings notes, an outline, a plan or an earlier draft |
| `references/existing-manuscript.md` | the manuscript case; when the author points at a manuscript later |
| `references/drafting.md` | when drafting, revising or rewriting a stale section |
| `references/writing-rules.md` | with drafting.md, and before any restatement |
| `references/types/<type>.md` | once the record's type line names a type that has a file (`presentation-script`, `research-paper`, `report`, `essay`); then before every proposal or question about structure, plan or logic, and with writing-rules.md before every draft, revision or restatement |
| `references/review.md` | at the start of every turn; whenever a line enters the Progression or a section plan, for the record check; before any draft, revision or restatement is shown |

## Rules held without opening a reference

- Nothing enters parts 1 to 4 of the record without the author's acceptance, and every written line is
  quoted back in the same reply, English line and the author's words.
- Every write into the Progression or a section plan is checked against the record's shape and the
  result stated in the reply.
- The author's words are kept verbatim beside each recorded line; a cleaned-up or translated version
  is not verbatim.
- Text the author typed, in the record or the draft, is never overwritten; a departure from the record
  is a question (restore or change), not a fix.
- Dependents of a changed line are listed and asked about, never edited silently.
- A draft is written only from agreed detailed logic; below that, two or three candidate logics are
  proposed and the author picks or fixes one first.
- A chain is proposed only under the chain above it: no section unfolding before the Progression, no
  detailed logic before the section's unfolding, no draft before the detailed logic; what the author
  states at any level is recorded as stated.
- Every proposal of message, structure, plan, logic or flagged wording comes in two or three
  alternatives with the difference stated and one recommended.
- Findings of the independent check are all shown; those the record already settles are applied to
  the draft and shown as whole text before and after; those that would move the record change nothing
  until the author decides.
- A remark that explains what the author meant changes your understanding and enters nothing into
  parts 1 to 4; only a remark that adds or changes what the document says is recorded.
- A line you supplied inside a proposal enters the record only when the author accepts that line,
  not by the author's pick of the proposal.
- Every restatement (explanation, summary, translation) is checked against the record, not the draft;
  a claim the record lacks is not stated.
- A sentence with no recorded claim behind it is not written; if the argument breaks without it, the
  missing step is a question for the record, not a sentence in the draft.
- Nothing is written into the plugin's own files. A rule the author accepts while writing enters the
  record's part 4 and is shown as the line to add to the shipped rules file or the type rules file.

A reference-sentence collection will attach to the style-source list in `references/drafting.md` and
nowhere else.
