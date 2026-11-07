# Business rules

The skill's domain is one author, one document per folder, and two files the author owns. Every rule below is stated so that a test can be derived from it.

## The record (`design.md`)

- Five top-level parts in fixed order: Overview, Structure and section plans, Detailed logic, Emphasis and wording, Status. They are not renamed, merged, reordered or added to. Headings below them vary per document.
- Parts 1 to 4 hold only what the author has accepted. A line enters them when the author stated it unprompted, or when the author accepted a proposal in words. A proposal the author has not answered lives in Status and is never written into parts 1 to 4; nothing is drafted on top of it.
- Every line written into parts 1 to 4 is quoted back to the author in the reply that wrote it: the English line and, beside it, the author's own words. A reply that writes a line and does not quote it violates the rule.
- The author's statement is kept verbatim beside the English line whenever the author did not type that English line themselves. A translated or cleaned-up version beside the English line is not verbatim.
- A line that replaces an accepted line carries a note of what it replaced, one note per line, the most recent replacement only.
- No provenance tags, no transcript of questions and answers, no reasoning the author did not state. A reason is written only when the author gave it and a later reader could not derive it from the record.
- The record is written in English except the author's verbatim words and expressions the author wants kept, which stay in the document's language.
- The record is the authority over the conversation. The author may edit it by hand at any time, so it is re-read in full at the start of every turn. Status is a hint: when Status and the body disagree, the body is right and Status is corrected in the same turn, with the correction named.

## Claims, relations, conditions

- A claim has one role from the set need, cause, judgment, question, proposal, description. The role is the one the author gave; a need is not softened into a judgment about alternatives, a judgment is not promoted into a cause.
- A relation from one claim to the next has one kind from the set cause, contrast, condition, consequence, question/answer, and a condition when the author gave one. When the author stated a relation without a condition, the relation is recorded alone; no condition is supplied.
- A condition the author attached to a relation appears in the sentence that renders the relation in every draft, whether or not the sentence reads well without it.

## Levels

- Six levels: `type`, `reader-and-topic`, `structure` for the whole document; `plan`, `logic`, `wording` per section. A section's level is the highest the author has accepted. A section whose Status says `logic` but has no Detailed logic entry is at `plan`.
- The level of a request is inferred from the request and Status. The author may open any level at any time; no level is a precondition for another, and no command changes level. When a request fits two levels, the skill asks which.

## Questions

- A decision about message, structure, a claim, a relation, a condition, an emphasis, the order of argument or a wording the author cares about is either grounded in what the author said (or follows from it with the record) and is realized, or it is asked. It is never defaulted.
- A question is asked only when all three hold: it lands at a named place in the document; the record does not already settle it (checked, not assumed); something specific goes wrong in the text if it stays open. That a point could be explained further is not a ground.
- A question the author already answered, in the session or in the record, is not asked again. A question the author declined stays in Status marked declined and is not raised again in any wording unless the author reopens it.
- There is no cap on the number of questions. A structured question has at most four options; a question about the author's own meaning includes an open "my own answer" option among them.
- Decisions taken without asking are limited to choices with no effect on meaning, role, strength, emphasis or order: joining or splitting sentences over recorded claims, the connective among synonyms for a recorded relation, punctuation, paragraph breaks inside a section's recorded unfolding, surface grammar of an unflagged sentence.

## Proposals

- A proposal is made, instead of a question, for the central message or topic framing, the structure or a section plan, a section's detailed logic, and a rendering of a sentence the author flagged. It offers two or three alternatives, states the difference in what each makes the text say or emphasize, and recommends one. A single-alternative proposal violates the rule.
- A rejected alternative is recorded under the section's emphasis and wording notes (rejected logic or rejected addition) when a later draft or proposal could otherwise bring it back; it is not proposed again.

## Contradictions

- When a new statement contradicts an accepted line, the line is changed with a note of what it replaced and quoted back. Every other accepted part that rests on the changed line is listed to the author with a question per part. No dependent is edited on the skill's judgment.
- The drafted text of the changed section, and of every dependent section the author changes, becomes `stale`.

## Drafting

- A section is drafted only when its level is `logic` or `wording` and its Detailed logic entry exists. Below that, the skill proposes two or three candidate logics built from what is agreed and drafts only after the author picks or fixes one. A request for a draft is not acceptance of a candidate.
- A whole-document draft proceeds one section at a time: draft, check, show, then wait for the author's word before the next section.
- Every sentence corresponds to a recorded claim, a recorded relation, or an addition the author accepted. A sentence without one is not written. When the argument breaks without it, the missing step is a question for the record, not a sentence in the draft.
- A claim keeps its role and strength; the recorded order of claims is the draft's order; rejected additions stay out under any wording; a corrected word pair is honored in every section; a kept expression is used verbatim.
- The draft is in the document's own language regardless of the conversation's language.
- Style sources are exactly three: the shipped rules file, the user rules file (when it exists; wins on conflict), and the document's emphasis and wording notes. A fourth source is added to that list and nowhere else.

## Checks

- Self-check: before any draft or revision is shown, the whole section is compared claim by claim and relation by relation with the record, from a sentence-to-claim mapping; a failed comparison is fixed and the check rerun from the first comparison; text is shown only after a pass that changed nothing. The reply names that the check ran and what it changed.
- Restatement check: an explanation, summary or translation of a draft is compared with the record, not with the draft; a statement with no recorded line behind it is not sent, and a draft that contains it is reported as a mismatch.
- Independent check: after every full-section draft (first draft, redraft, whole-section rewrite), a fresh subagent that did not write the draft receives only the section's Detailed logic entry, its Emphasis and wording entry, and the draft text, and returns mismatches with site, record line and draft line. Every finding is shown to the author. The draft changes only on the author's word, finding by finding; no finding is applied because a neighbour was accepted. A revision of some sentences gets the self-check only.
- Per-turn re-comparison: at the start of every turn the record and draft are re-read in full; the section the request names (else the last worked on) is compared with its draft; a disagreement is reported before the request is touched.

## Revision and corrections

- A correction changes the part of the text it concerns and nothing else. The record is updated first (corrected pair, condition, rejected addition, replaced claim, moved emphasis), quoted back, then the draft is revised and self-checked.
- A correction that states a rule beyond this document is proposed in general words; on the author's acceptance of the wording it is appended to the user rules file `~/.claude/www/writing-rules.md`, created on the first such rule. The plugin's shipped rules file is never written at run time.
- After a correction, the next text sent is checked for the same kind of addition before it goes out.

## Stale drafts

- When an accepted line changes after its section is drafted, the section's draft state becomes `stale` and the author is told which section and which line. The draft is rewritten only when the author asks. A whole-section rewrite is a full-section draft (independent check); a rewrite of a few sentences is a revision.

## Hand edits

- Text in the draft the skill did not write and that departs from the record is a correction by the author. It is never overwritten or reverted. The skill asks whether the record should change to match (then records the author's line, verbatim, with its replacement note, and runs the dependents procedure) or whether the draft drifted (then the author decides the wording and the pair goes under distinctions). A hand edit that renders the same recorded line stands without a question. A sentence the author added with no recorded line behind it is asked about, not cut.
- The same restore-versus-change distinction applies to an existing manuscript: a restore records the pair of wordings as a distinction to preserve; a change records the old argument as a rejected logic.

## Existing manuscript

- A manuscript (a text file the author points at, or text files present with no record) is read-only; `draft.md` is the working copy, made unchanged before the walk, and the author is told. When several text files are present and none is pointed at, the skill asks which one.
- The reconstruction of its structure and argument enters Status as pending proposals; parts 1 to 4 stay empty until the author accepts a line. Each reconstructed line ends as accepted, changed, restored or open; silence is open, not acceptance.

## Document types

- Research papers, reports and presentations are handled by the same method; no document type has a template. The structure of a report or presentation is discussed from its purpose.
