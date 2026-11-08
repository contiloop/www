# Cases: what earlier documents taught

A case is your memory of one finished document: what the author brought, what the first drafts got wrong, what the author corrected and in what words, what changed in answer, and what that taught. Cases live in the case store, `~/.claude/www/cases/`, outside every document folder, and this file governs the store: when a case is written, what it holds, when it is read and what it may change. The record (`design.md`) governs what a document says; a case governs only how you write it. Against the record of the document at hand, a case has no standing: it may change how a recorded claim is worded, never which claims there are.

## The store

The store is `~/.claude/www/cases/`, one Markdown file per document, created only on the author's word. The file name is `<YYYY-MM-DD>-<document folder name>.md`: the date is the day the case is first written, and the folder name is the last path component of the document folder as it is, in whatever script the author named it, neither transliterated nor translated. The store folder is created with the first case, not before. Nothing else is written there, no index, no copy of the record or the draft, no note beside a case: a reuse pass reads every file in the store as a case. With the record, the draft and the user rules file `~/.claude/www/writing-rules.md`, the store is the fourth and last path you write at run time.

## One case per document

A document folder has at most one case. The key that finds it is the folder's absolute path in the case's `Document:` line; the title beside the path is for a reader and is not matched on, since the author may retitle the document between sessions. When a document reaches the end again after further work, show the existing case with its additions and, on the author's word, rewrite the whole file under its existing name, with the `updated` date changed and the `written` date and the file name untouched. A second file for the same folder is not created whatever the day's date: two cases for one document would split one history and match twice at reuse.

## Shape

A case is written in English, in this order, under these headings:

```
# Case: <document title>
Document: <folder path> — <title>; written <date>, updated <date>
## Task type
## Task context
## Materials
## First-draft problems
## Author feedback
## Revisions made
## Lessons
### Given or accepted by the author
### Inferred by the skill
```

The headings are the file's contract: reuse reads a case by them, so a case written under others is not read. As in the record, the author's words stand verbatim beside any line that quotes them, and kept expressions stay in the document's language. What each heading holds:

- Task type: one of the fixed set `presentation script | research paper | report | essay | other`, chosen from the record's type line, with that type line copied verbatim beside it. Matching reads the set, so a type stretched to fit hides the case from the documents it would help and offers it to those it would not; a type outside the set is `other`.
- Task context: the purpose, the reader and what they judge from the text, the tone, the format and length, the language.
- Materials: what the author brought (notes, a poster, an outline, a manuscript, an earlier draft) and how each was used.
- First-draft problems: what went wrong in the first drafts of each section, as the sentences the author saw, so a later reading recognizes the same shape in a new sentence.
- Author feedback: what the author criticized, corrected or asked for, verbatim, including understanding remarks (`references/elicit.md`): an explanation that corrected your reading of what the author meant and settled no line of the record, which the record therefore does not hold and only the case keeps.
- Revisions made: what changed in answer to each feedback item, with the sentence before and after where short.
- Lessons, in two groups kept apart. The first holds only rules and instructions the author stated or accepted in words. The second holds what you concluded on your own and stays marked so; a lesson you inferred written under the author's group would be read, at reuse, with the author's authority, which is the one thing a case must not acquire.

Document text may be quoted in First-draft problems, Author feedback and Revisions made as the record of what changed; a quoted claim or sentence is an illustration of the change, not a claim available to a later document (see The boundary below).

Abridged, for a two-section internal report whose folder is `/Users/author/문서/야간백업`, written to `~/.claude/www/cases/2026-03-02-야간백업.md`:

```
# Case: Night backup report
Document: /Users/author/문서/야간백업 — Night backup report; written 2026-03-02, updated 2026-03-02
## Task type
report — "Type: internal report, two pages, for the operations lead"
## Task context
Approval of a schedule change by an operations lead who judges whether to sign this week; two pages, plain, English; discussed in Korean.
## Materials
A one-page incident note from April and a cost quote for one disk, both used for the claims of the Risk section; no outline.
## First-draft problems
Risk: "A nightly backup should be considered" rendered C3 (need) as a judgment about alternatives. Proposal: a sentence comparing disk cost with cloud storage, with no claim behind it.
## Author feedback
- "지금 승인받아야 해요. 검토할 일이 아니라" — C3 is a necessity, not an option.
- "클라우드 얘기는 왜 나와요?" — the cloud comparison was not asked for.
## Revisions made
- "should be considered" → "must be approved now"; the comparison sentence cut and recorded as a rejected addition.
## Lessons
### Given or accepted by the author
- A claim the author voices as a necessity is written as one; "should be considered" is not a necessity.
### Inferred by the skill
- A reader who approves a change reads the cost in the sentence that asks for approval, not in a paragraph of its own.
```

## When a case is written

Offer once per session to write the case when every section the author has not skipped has draft state `drafted`, no open question in Status is unanswered and no proposal is pending. A section left at level `none` under the whole-document rule of `references/drafting.md` counts as skipped; a question marked declined is answered. Write a case whenever the author asks, at any stage of the document: what the first drafts got wrong is known as soon as the author has corrected them.

The offer is a question. Declined, it goes to Status under open questions in the existing line shape:

```
- Whether to record this document as a case; lands in the case store, not in the document; nothing in the text depends on it — declined
```

and is not offered again in this document unless the author asks.

Show the whole case text in the reply before anything is written; the author may strike or correct lines, and a struck line is left out, a corrected line written as corrected with the author's words beside it. Write the file on the author's word and say where, path and file name. A sandbox that refuses the write is reported in one line, and the case text stays in the reply for the author to save by hand, as for the user rules file.

## Reuse

Cases are read at two moments. The first is when the document type and the reader are recorded: at document start once both are accepted, at entry when an existing record already holds them, or when the Overview proposals of the manuscript walk (`references/existing-manuscript.md`) are accepted. Read every file in the store and match on task type first, then on purpose, reader and what they judge, and the kind of material the author brought. Name in one line the cases you will draw on, by title; that line is a result in the sense of the speaking rule of `SKILL.md`, like a recorded line quoted back, not an announcement of reading. With no store or no matching case, nothing is said. The author may say to ignore a named case, and that holds for the session.

The second is before drafting, revising or checking a section: read the named cases again, for their First-draft problems, Author feedback, Revisions made and Lessons, which hold the sentence shapes that failed before, the corrections the author had to make, and what was done about them. What the session remembers of a case read at document start is not the case; the file is.

## The boundary

A case shapes how you write, never what the document argues. No claim, relation, condition, figure, definition or sentence from a case enters this document's record, its proposals or its draft; the document's `design.md` governs its logic alone, and a claim found in a case that this record lacks is as unavailable as one you would invent (rule 35 of the shipped rules file, with rules 1 and 3).

A lesson may change a drafting choice: how a term is introduced, where a condition is placed in a sentence, what a first-time listener needs before a claim. It may also raise a question to the author under the three grounds of `references/elicit.md`, when an earlier document's correction shows where this record is likely to be silent; the question is asked, and the earlier document's answer is not supplied as this one's. Its reader judged something else, and the author decides what this one says.

## Cases and rules

Rules and cases stay apart: a lesson binds nothing beyond its case, a rule in the user rules file binds every later draft. A lesson becomes a rule only through the existing path: proposed in general words (rule 30 of the shipped rules file), accepted in wording by the author, appended to `~/.claude/www/writing-rules.md` (rule 33). Propose this at two moments: when writing the case, for a lesson whose wording passes rule 30's test, holding for a report, a grant proposal and a product manual alike; and at reuse, when the same lesson stands in two or more matching cases. A lesson that fails the test stays a lesson, in its case, and does not become a rule by being repeated. The record receives nothing from a case: no lesson under emphasis and wording notes, no claim in detailed logic.
