# Drafting the text from the record

The draft (`draft.md`) is the document's text, one heading per section, written in the document's own language. Every sentence in it answers to a line in the record (`design.md`): a numbered claim, a relation between two claims, or an addition the author accepted. The reader of the draft must find the recorded argument, with the roles, strengths, conditions and order the author fixed, and nothing the author did not fix. The record is the only input to a sentence; the conversation supplies what the author said, which goes into the record before it goes into the draft.

## What a section is drafted from

A section is drafted only when its level in Status is `logic` or `wording` and its part 3 entry exists. A section marked `logic` whose part 3 entry is missing is at `plan`, and a section at `plan` or `none` has nothing a draft can be checked against.

When the author asks for a draft of a section below that level, propose two or three candidate detailed logics for it instead, built only from what is agreed: the section's plan in part 2, the overall progression and message in part 1, the claims of neighbouring sections that this one must prepare or use, and the material the author gave for it. Each candidate is a numbered chain with roles, relations and conditions in the part 3 form; state what each makes the section argue that the others do not, recommend one, and record the proposal in Status. A candidate carries no condition the author did not state and lists apart, as yours, any line the author never said, per the proposal rule of `references/elicit.md`: the author's pick of a candidate accepts the chain only. Candidate logics listed as rejected under the section's emphasis and wording notes are not proposed again. Draft only after the author picks one or fixes one; the accepted chain is written into part 3 and quoted back before the first sentence is drafted. The author's request for a draft is not an acceptance of your candidate.

A declined open question that lands in the section does not block the draft: draft from what is agreed around the gap and name the gap when showing the text.

## The whole document

A request to draft the whole document is executed one section at a time, in part 2 order unless the author names another: draft the section, run the checks in `references/review.md`, show the text with the check results, then wait for the author's word before starting the next section. The author's word may be "continue" or a correction; a correction is handled under Revision below before the next section is begun. Do not draft two sections in one pass, and do not start the next section while category B findings of the independent check, those whose fix would move the record, are unanswered; category A findings, which the record already settles, are applied to the draft and shown before and after, and do not hold up the next section (`references/review.md` defines both categories). A section in the sequence that is below `logic` gets the candidate-logic proposal above, and the sequence resumes only after the author settles it or says to skip it, in which case its draft state stays `none`.

## The absence test

Before writing any sentence that does not render a numbered claim or a recorded relation, ask: what in the agreed argument breaks if this sentence is absent? "Breaks" means a reader cannot get from one recorded claim to the next with what the text has given them; that the passage reads abruptly, that the step could be explained further, or that a reader might wonder about something is not breakage. Nothing breaks → the sentence is not written. This test covers transitions, caveats, qualifications, contrasts, implications, summaries and takeaways alike; each of these is a sentence without a claim behind it until the author gives it one.

When something does break, the record is missing a claim or a relation, and the repair belongs to the record, not the draft. Name the two recorded claims between which the text breaks, state the missing step and what the reader cannot get from the first claim to the second without it, and ask the author to accept the step as an addition, with the three grounds of `references/elicit.md`. Accepted, the step enters part 3 as a claim with its relation, or part 4 as a kept expression when it carries no claim, through the recording path of `references/design-format.md`, and is quoted back; the sentence is then drafted from the updated record. Declined, the gap stays and the shown text names it. This is the only route by which a claim, condition, contrast, premise or causal link the record lacks reaches the draft, while drafting and while revising alike: a step written into the draft on the expectation that the author will accept it has bypassed the record, and so has a step taken as accepted because the author asked for a draft.

## What each sentence preserves

The tests for each of these, with the disposition when a sentence fails, are the rules of the shipped rules file `references/writing-rules.md`; this file names what is at stake and does not repeat the tests.

- A claim's role and strength: a `need` is written as a necessity, a `judgment` as the author's judgment, a `question` as a question; nothing stronger and nothing weaker than the recorded line.
- Every condition the record attaches to a relation, in the sentence that renders the relation, even when the sentence reads well without it. A condition the author stated once is as binding as a claim.
- No condition the record does not state. A relation recorded without a condition is rendered without one; when you believe the relation needs a condition to hold, the condition is a question to the author under the three grounds of `references/elicit.md`, in a draft and in a proposal alike, and a condition you supplied to make a sentence carry has replaced the author's argument with yours.
- The connective that renders a relation has that relation's sense: a `consequence` is not written with a contrast word, a `cause` not with "and".
- The recorded order of claims. Two claims may share a sentence or be split across two; they do not swap, in drafting or in revision; a revision that cannot keep the order readable in place is a question, not a reorder.
- Rejected additions stay out, under any wording. Before showing text, search it for the kind of sentence each rejected addition names.
- Distinctions recorded as a corrected pair are honored in every section and every later draft, not only where the correction came from.
- No grandiose or abstract wording, and none of the recurring frames the shipped rules file lists, in any language the draft is written in.

The choices you take alone are those `references/elicit.md` leaves to drafting: joining or splitting sentences over recorded claims, the connective among synonyms, punctuation, paragraph breaks inside the recorded unfolding, surface grammar of unflagged sentences, and the connectives, verb endings and back-references inside a sentence that tie it to the sentence before; these let a run of recorded claims read as one passage rather than a list and need no claim of their own, provided they carry no relation sense the record lacks (rule 2 of the shipped rules file) and no contrast where the record draws none (rule 18). A transition that stands as its own sentence is a sentence and needs a recorded line (rule 1). A choice that would make the author re-read a claim to see whether it still says what they meant is a question, not a drafting choice.

## Questions during drafting

Drafting may raise questions, under the three grounds of `references/elicit.md`: a relation the record states without the condition that would let you render it, a claim whose role you cannot word in the document's language without changing it, a kept expression that does not fit the sentence the claim needs. When the draft of a part depends on the answer, ask before showing that part; show the parts that do not depend on it, and name where the pending question lands. Do not show a placeholder rendering of the dependent part and ask afterwards; a shown sentence anchors the author's reading.

## Style sources

While drafting and revising, every sentence is tested against exactly these three style sources, named here and nowhere else:

1. The shipped rules file, `references/writing-rules.md`.
2. The user rules file, `~/.claude/www/writing-rules.md`, read when it exists; where its rule conflicts with the shipped file, the user rules file wins.
3. The document's emphasis and wording notes in part 4 of the record: the conditions that must survive, the claims to emphasize, the corrected pairs, the kept expressions, the rejected additions.

A future collection of reference sentences is added to this list and nowhere else.

Cases named per `references/cases.md` are read again before a section is drafted, revised or checked; they are not a style source and change drafting choices only (how a term is introduced, where a condition sits in a sentence, what a first-time reader needs first), never what a sentence says, and no claim, relation, condition, figure, definition or sentence from a case enters this document's record, proposals or draft.

The first two sources are rules that hold across documents; the third is the author's decision for this document and is not weighed against them: a kept expression stands even when a rule in the first two sources would reword it, because the author chose the words knowing the sentence.

## The language of the draft

The draft is written in the document's own language, the one its reader reads: taken from the document type and venue in part 1, or from the existing manuscript, or asked once at document start if neither fixes it. The language the author uses in conversation does not change the draft's language; a document written in English is drafted in English while the author discusses it in Korean, and the explanations you give of it in Korean are restatements, checked as `references/review.md` describes. Kept expressions are already in the document's language and are used as recorded.

## Revision

A correction from the author is applied to the part of the text it concerns and to nothing else. Sentences the correction does not touch are not reworded, even when you would now word them differently; a revision is not a redraft of the section.

A correction is first read for its kind, a content remark or an understanding remark, per `references/elicit.md`. Before revising, settle what the correction means when it leaves this open. "This is wrong" without what it should say, a corrected word whose sense could be a wording preference or a changed claim, an emphasis the author wants moved without saying onto which claim: each is asked under the three grounds, with a concrete reading the author can adjust. A correction whose intent is plain is not asked about.

Then update the record before touching the draft, so the correction exists where every later draft and check reads it:

- a struck word becomes a corrected pair under distinctions in part 4;
- a dropped condition is added to the relation in part 3 and listed under conditions that must survive;
- an unrequested sentence becomes a rejected addition, named so a later draft recognizes it under other wording;
- a changed claim replaces its line in part 3 with the note of what it replaced, and the dependents procedure of `references/elicit.md` runs for every agreed part that rests on it;
- a moved emphasis is written under claims to emphasize, naming the claim it now rests on.

Quote the recorded lines back in the same reply. Then revise, then run the self-check of `references/review.md` on the section before showing the revised text. The section's draft state stays `drafted`.

When the correction states a rule that applies beyond this document, propose the rule in general words that cover every situation where the same reasoning holds (rule 30 of the shipped rules file), and on the author's acceptance of the wording append it to the user rules file, creating the file on the first rule. The shipped rules file is never written to: it is replaced on plugin update. The record still receives the document-specific entry above; the user rule guards later documents, the record entry is what this document's checks compare against.

## Stale drafts

When an agreed line changes after its section is drafted, through a direct correction, a dependent the author chose to change, or a document-wide line the section rests on, the section's draft state becomes `stale` in Status and the author is told which section and which line in the same reply. That sentence and the flag are the whole response to the change; the draft is not rewritten until the author asks. On request, the rewrite touches the sentences that render the changed lines and the relations into and out of them; the rest of the section stands unless the author asks for a full redraft. A rewrite of a whole section is a full-section draft and gets the independent check; a rewrite of a few sentences is a revision. The draft state returns to `drafted` once the rewritten text has passed the self-check and been shown.
