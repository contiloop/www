# Existing manuscript

This file governs the skill when the document folder holds text the author wrote before the record existed: a file the author points at, or text files present with no `design.md`. The manuscript is input. It is never edited, reformatted, renamed or moved, and no sentence in it is improved while it is read. Everything the skill writes goes to `design.md` and `draft.md`.

## Which file is the manuscript

One text file beside no `design.md` is the manuscript. When several text files are present and the author has not pointed at one, or when the pointed-at file is not Markdown (a word-processor export, plain text with no headings, a PDF's text), ask the author which file is the manuscript and how its sections are delimited before reading it as one. Guessing here puts the wrong document, or the wrong section boundaries, under every later question.

When a record already exists and the author points at a manuscript, the file is read as material against that record: a reconstructed part that agrees with an agreed line is noted as already settled, one that differs is a question for the author under the restore-versus-change rule below, and parts the record has not reached are proposed as this file describes.

## The working copy

Before the walk begins, copy the manuscript's text into `draft.md` unchanged, in the document's own language, one heading per section as the text has them. Tell the author in the same reply that the original file stays as it is and that every revision from now on is made in `draft.md`. In Status, every section's level reached is `none` and its draft state is `drafted`: text exists, nothing about it is agreed. Do not write `draft.md` before the author has answered the which-file question above.

## The proposed record

Read the whole manuscript, then reconstruct what the record would hold if the text were the author's agreed design. Fill, as proposals:

- Overview: the document type, the reader and venue the text addresses and what that reader will judge from it, the central topic, the message the text leaves, and the Progression in the shape of `references/design-format.md`: one step per line, each step a claim-sized statement the text's argument moves through, each join carrying the relation the text states between the two steps. Where the text moves from one step to the next with no stated relation, the join is marked "no relation given" rather than supplied.
- Structure and section plans: the ordered sections and, for each, what it covers and its unfolding in the shape of `references/design-format.md`, its steps the Progression's steps that fall in the section, or steps of that size, each join carrying the relation the text states or "no relation given".
- Detailed logic, per section: the numbered claims in the order the text makes them, each with the role the text gives it (need, cause, judgment, question, proposal, description), and between each pair the relation the text actually states (cause, contrast, condition, consequence, question/answer, elaboration) with the condition the text gives for it. Where the text moves from one claim to the next with no stated relation, record the step as "no relation given" rather than supplying one; where a sentence carries no claim (a transition, a caveat, an implication, a summary), list it under the section as a sentence with no claim behind it.
- Emphasis and wording: what the text stresses by position, repetition or strength of wording; distinctions its word choices draw; conditions it keeps attached to claims; expressions characteristic of the author.

Every line is written in English with the manuscript's own words quoted verbatim beside it; the manuscript is the author's statement until the author says otherwise. Each line goes into Status as a pending proposal, tagged with the part and section it belongs to. Parts 1 to 4 of `design.md` stay empty. The reconstructed lines, read as one list, are the list of parts the walk must close.

The record proposes only what the text supports. A role the text leaves ambiguous ("X is possible" could be a judgment or a proposal) is recorded with both readings and becomes a question. A relation the skill would consider stronger or more correct than the one written is not substituted; the written one is recorded and the difference, if worth raising, is a question.

## The walk

The walk descends from the whole to the claim. First the reconstructed Progression is confirmed; then, section by section in the text's order, the section's unfolding and only then its claims. At the Progression and at each unfolding the order the text has is kept and is not asked about; what is asked is the relation at each join, pair by pair, and a join marked "no relation given" is answered by a relation the author names or by a decline, which is recorded as the declined join of `references/design-format.md`. For each section, show the reconstructed plan with its unfolding, the numbered claims with roles and relations, and the emphasis notes, and ask where the written text matches the argument the author meant and where it does not.

Infer and confirm lightly what the text shows plainly: the section boundaries, the order of claims, the surface wording. Confirm deeply, claim by claim, what the text can show but cannot prove the author meant: each claim's role, each relation and the condition that makes it hold, and each emphasis. A false belief in these three places is reproduced in every later draft and in every check that compares a draft against the record, so the cost of a confirming question is small beside the cost of being wrong. A text that reads well is the dangerous case: it makes a role or relation look settled when only the author can settle it.

The questioning rules of `references/elicit.md` hold here: each question states where in the document it lands, why the text does not settle it, and what goes wrong in the draft if it stays open; a question about the author's own meaning carries an open "my own answer" option; an answer that reveals a further unsettled point is followed up before the section is left. A sentence with no claim behind it is asked about, since the author may hold a claim the sentence only implies, may want the sentence kept as wording, or may want it gone.

Begin with the Overview so the author can object to the frame; its Progression is confirmed first, before any section's unfolding, and its Message line is accepted last: the message is what the accepted claims add up to, and a section's walk may change it.

## Closing each part

Every line in the list ends in exactly one of four states. The walk of a section is complete when a scan over its lines finds none still unmarked; the walk of the document is complete when every section's scan is clean and the Overview is closed.

- Accepted: the text says what the author meant. The line moves from Status into its part of `design.md` and is quoted back in the same reply. A section's level reached rises to `plan` when what it covers and its unfolding are accepted, to `logic` when every claim and relation in it is accepted, changed or restored, and to `wording` when its emphasis lines are closed the same way. The draft state stays `drafted` while nothing in the section was changed or restored.
- Changed: the author now wants a different argument from the one the text makes. The author's statement is recorded in the part, in English with the author's words verbatim, with a note of the line it replaced; the text's version is listed under rejected candidate logics so it is not proposed again; the section's draft state becomes `stale`.
- Restored: the text misstates an argument the author did hold when writing. The author's intended line is recorded in the part with a note of what the text said; the pair of wordings (the text's and the intended) is listed under distinctions to preserve, so no later draft slides back; the section's draft state becomes `stale`.
- Open: the author has not settled it. The line stays in Status as an open question; a question the author declines is marked declined and not asked again, and the part it concerns is drafted later from what is agreed around it.

A line is never left out because it seemed minor, nor marked accepted because the author passed over it without comment; silence is open, not acceptance. Nothing enters parts 1 to 4 on the skill's reading alone.

## Restore versus change

Changed and restored both replace a line and both make the draft stale, and the record must say which happened. A restore means the draft drifted from what the author intended: the author's intent is the standard, the text's wording is a known distortion, and the distinction goes under emphasis and wording where every later draft and check reads it. A change means the intent moved: the text's version was a real position the author once held and has left, so it is a rejected candidate, not a trap in the wording. Recording a restore as a change loses the wording guard and lets the drift recur; recording a change as a restore forbids wording that was never wrong and makes the record claim the author meant something they did not.

When the author's answer leaves it unclear which case holds ("that's not right, it should say Y"), ask whether Y is what the text was meant to say or a new decision before recording. The same question, asked the same way, applies on any later turn when `draft.md` holds text the skill did not write and the text departs from the record.

## After the walk

Tell the author which sections have stale drafts and what in each is stale. Rewrite a stale section only when the author asks; until then the draft is the manuscript's text and the record is the standard it is checked against.
