# Business rules

The skill's domain is one author, one document per folder, and two files the author owns. Every rule below is stated so that a test can be derived from it.

## The record (`design.md`)

- Five top-level parts in fixed order: Overview, Structure and section plans, Detailed logic, Emphasis and wording, Status. They are not renamed, merged, reordered or added to. Headings below them vary per document.
- Parts 1 to 4 hold only what the author has accepted. A line enters them when the author stated it unprompted as a content remark, or when the author accepted a proposal in words; an understanding remark enters nothing. A proposal the author has not answered lives in Status and is never written into parts 1 to 4; nothing is drafted on top of it.
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
- An author remark is one of two kinds. A content remark adds or changes a claim, relation, condition or emphasis, or says what the reader should hear; it goes through acceptance and recording. An understanding remark explains what the author meant, corrects the skill's reading or answers "is this what you mean"; it changes the skill's understanding only, enters nothing into parts 1 to 4 and is never drafted. When the kind is unclear, the skill asks which. A reply that writes an understanding remark into parts 1 to 4, or drafts a sentence from it, violates the rule.
- When an understanding remark shows that an agreed line is wrong, the skill names the line and asks before changing it, with three options: change the line; leave it; leave it and record a guard in part 4. A direct content statement about a claim changes the line at once, as under Contradictions.

## Proposals

- A proposal is made, instead of a question, for the central message or topic framing, the structure or a section plan, a section's detailed logic, and a rendering of a sentence the author flagged. It offers two or three alternatives, states the difference in what each makes the text say or emphasize, and recommends one. A single-alternative proposal violates the rule.
- A rejected alternative is recorded under the section's emphasis and wording notes (rejected logic or rejected addition) when a later draft or proposal could otherwise bring it back; it is not proposed again.
- When a proposal (a candidate logic, a message, a structure) carries a line the skill took from the author's material or supplied itself, that line is listed apart as the skill's own. The author's pick of the proposal accepts the chain only; each listed line enters the record only when accepted on its own and is held meanwhile as its own `proposals` entry in Status: `<section>, <claim it belongs to>, line the skill supplied: <the line>, alternatives: enter the record / leave out, recommended <one>`. A proposal carries no condition the author did not give.

## Contradictions

- When a new statement contradicts an accepted line, the line is changed with a note of what it replaced and quoted back. Every other accepted part that rests on the changed line is listed to the author with a question per part. No dependent is edited on the skill's judgment.
- The drafted text of the changed section, and of every dependent section the author changes, becomes `stale`.

## Drafting

- A section is drafted only when its level is `logic` or `wording` and its Detailed logic entry exists. Below that, the skill proposes two or three candidate logics built from what is agreed and drafts only after the author picks or fixes one. A request for a draft is not acceptance of a candidate.
- A whole-document draft proceeds one section at a time: draft, check, show, then wait for the author's word before the next section.
- Every sentence corresponds to a recorded claim, a recorded relation, or an addition the author accepted. A sentence without one is not written. When the argument breaks without it, the missing step between the two recorded claims is a question for the record, not a sentence in the draft; it is drafted only after it enters the record on acceptance.
- Transitions inside a sentence (connectives, endings, back-references) are drafting choices; a standalone sentence needs a recorded line. No condition is supplied by the skill, in a draft or in a proposal.
- A claim keeps its role and strength; the recorded order of claims is the draft's order and claims are never reordered; rejected additions stay out under any wording; a corrected word pair is honored in every section; a kept expression is used verbatim.
- The draft is in the document's own language regardless of the conversation's language.
- Style sources are exactly three: the shipped rules file, the type rules file of the record's type (when the type has one; it wins over the shipped file on conflict), and the document's emphasis and wording notes. A fourth source is added to that list and nowhere else.

## Checks

- Self-check: before any draft or revision is shown, the whole section is compared claim by claim and relation by relation with the record, from a sentence-to-claim mapping; a failed comparison is fixed and the check rerun from the first comparison; text is shown only after a pass that changed nothing. The reply names that the check ran and what it changed.
- Reading check, comparison 8 of the self-check, run before every shown text: the section is read in sentence order and each sentence is judged against the recorded claims rendered so far. It fails when a term or referent has no earlier rendered claim, when two sentences cannot both render the record, when a connective promises a relation the record does not draw or the next sentence does not deliver, or when consecutive claims are rendered without their recorded relation carried (a list where the record has a chain). A failure is fixed within the record and the self-check rerun from comparison 1; a fix that needs a new line is a question.
- Restatement check: an explanation, summary or translation of a draft is compared with the record, not with the draft; a statement with no recorded line behind it is not sent, and a draft that contains it is reported as a mismatch.
- Independent check: after every full-section draft (first draft, redraft, whole-section rewrite), a fresh subagent that did not write the draft receives only the section's Detailed logic entry, its Emphasis and wording entry, and the draft text, and returns mismatches with site, record line and draft line. Every finding is shown to the author and is one of two categories. A revision of some sentences gets the self-check only.
- Category A finding: the record stands and the draft moves toward it (a role, strength, subject or connective sense restored; a dropped condition restored; a claimless sentence cut when the absence test passes; an absent claim rendered; order restored; a rejected addition cut; a struck word replaced; wording and flow so the chain reads in sequence). It is applied to `draft.md` before the text is shown, without a question; the self-check reruns; no second independent check is dispatched. It is never applied to text the author typed.
- Category B finding: the fix would move the record (a claim, condition, relation, premise or contrast added, removed or changed; a claimless sentence whose removal breaks the chain; a finding that misreads the record; a fix that needs a sentence the record has no line for). It is shown with the finding's three fields, the record line and the proposed change, and asked; the record changes first, then the draft. A sentence under a pending category B finding gets no category A fix until the author answers. In the whole-document tempo, an unanswered finding that holds the next section is a category B finding.
- Each applied fix is shown as the complete sentence before and after, in the draft's language, with a one-line reason; when the paragraph's flow changed, the whole paragraph before and after; a fragment or a description of the change violates the rule. Then the whole section is shown and the author is asked whether any fix is objected to. A rejected fix restores the prior sentence unless the author gives wording, and the finding becomes category B.
- Per-turn re-comparison: at the start of every turn the record and draft are re-read in full; the section the request names (else the last worked on) is compared with its draft; a disagreement is reported before the request is touched.

## Revision and corrections

- A correction changes the part of the text it concerns and nothing else. The record is updated first (corrected pair, condition, rejected addition, replaced claim, moved emphasis), quoted back, then the draft is revised and self-checked.
- A correction that states a rule beyond this document is proposed in general words, with whether it belongs to every document or to this document's type; on the author's acceptance of the wording it is recorded in the document's part 4, where this document's checks read it, and shown as the line to add to the repository's `writing-rules.md` or type rules file. The plugin's files are not written at run time; until the line is added in the repository and released, the rule guards this document only. A reply that writes a rule anywhere but part 4 violates the rule.
- After a correction, the next text sent is checked for the same kind of addition before it goes out.

## Stale drafts

- When an accepted line changes after its section is drafted, the section's draft state becomes `stale` and the author is told which section and which line. The draft is rewritten only when the author asks. A whole-section rewrite is a full-section draft (independent check); a rewrite of a few sentences is a revision.

## Hand edits

- Text in the draft the skill did not write and that departs from the record is a correction by the author. It is never overwritten or reverted. The skill asks whether the record should change to match (then records the author's line, verbatim, with its replacement note, and runs the dependents procedure) or whether the draft drifted (then the author decides the wording and the pair goes under distinctions). A hand edit that renders the same recorded line stands without a question. A sentence the author added with no recorded line behind it is asked about, not cut.
- The same restore-versus-change distinction applies to an existing manuscript: a restore records the pair of wordings as a distinction to preserve; a change records the old argument as a rejected logic.

## Existing manuscript

- A manuscript (a text file the author points at, or text files present with no record) is read-only; `draft.md` is the working copy, made unchanged before the walk, and the author is told. When several text files are present and none is pointed at, the skill asks which one.
- The reconstruction of its structure and argument enters Status as pending proposals; parts 1 to 4 stay empty until the author accepts a line. Each reconstructed line ends as accepted, changed, restored or open; silence is open, not acceptance.

## Type rules

- The document type is one of `presentation script | research paper | report | essay | other`, named by the record's type line. All five are handled by the same method; no type has a template, and a document's structure is discussed from its purpose.
- Each type except `other` has a rules file in the plugin, `references/types/<type>.md`: `presentation-script.md`, `research-paper.md`, `report.md`, `essay.md`. A file holds numbered rules in the form of the shipped rules file, each with its test and its disposition.
- When the record's type line names a type with a file, the file is read with the shipped rules file for every draft, revision and restatement, and the reply that quotes the type line back names the file. A draft or restatement checked without it violates the rule.
- Where a type rule conflicts with a rule of the shipped rules file, the type rule wins.
- A rule enters a type file only in the repository: appended at the end of the file, the three manifest versions raised, the packages rebuilt. A type file, installed or in the repository, written by the skill at run time violates the rule.
