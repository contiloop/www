# Checks on the draft and on what is said about it

Every check in this file compares against the record (`design.md`), never against the conversation and never against the draft itself. The conversation is where the drift the record exists to catch was produced; the draft is the thing under test. A check that reads the draft and finds it internally consistent has checked nothing. Four checks run: the self-check before any text is shown, the restatement check before anything is said about a draft, the independent check after a full-section draft, and the re-comparison at the start of every turn. When a check and Status disagree, the check is right; Status is a note of where things stood when it was last written.

## The self-check

Run on every draft and every revision of a section, before the text is shown, over the whole section, not only the sentences just written: a fix in one sentence moves the connective, the order or the condition of its neighbours. First write, in session and in no file, the sentence-to-claim mapping: for each sentence of the section, the claim number it renders, the relation it renders (as `Cn → Cn+1`), or the accepted addition it is, or `none`. Every comparison below reads from that mapping and from the section's part 3 and part 4 entries.

1. Claims present. For each numbered claim in part 3, the sentence that renders it exists; the sentence's main verb frame carries the recorded role; the strength is the record's, with no intensifier or hedge the record lacks; the subject and object are the recorded things, not a neighbouring concept.
2. Relations and conditions present. For each relation in part 3, the connective or sentence that renders it has the recorded sense, and the condition that makes the relation hold is present in that sentence as a phrase, whether or not the sentence needs it to read well.
3. No sentence without a line behind it. Every sentence mapped `none` fails. Apply the absence test of `references/drafting.md`: nothing breaks without it → cut; something breaks → a question to the author, not a sentence.
4. Order. The claim numbers read in sentence order are in sequence. A sentence rendering two claims renders them in their order.
5. Rejected additions absent. For each rejected addition in part 4, search the section for a sentence that does the same work under other wording; found → cut.
6. Corrected wording held. For each corrected pair in part 4, the struck word is absent in that sense and the required word is used; for each kept expression, it appears verbatim. Corrected pairs from every section's part 4 apply to this section.
7. Style. Each sentence against the three style sources named in `references/drafting.md`, by the tests of the shipped rules file, with the user rules file winning on conflict.

A failed comparison is fixed in the draft and the self-check is run again from comparison 1, because the fix changes the mapping. Text is shown only after a pass in which nothing was fixed. The reply that shows the text says that the self-check ran and names what it changed, in one or two lines, or says that it changed nothing; a check that leaves no trace in the transcript cannot be told from one that was skipped.

## The restatement check

A restatement is anything you say about what a draft says: an explanation of a section in the author's language, a summary of what the text now argues, a translation of a passage, the one-line account of a revision ("the paragraph now says that…"). Before a restatement is sent, each statement in it is matched to a recorded claim or relation in the record, not to a sentence of the draft. A statement with no recorded line behind it is not sent, even when the draft contains it: a draft containing it means the draft is wrong, and the mismatch is reported to the author instead of being repeated in the restatement. A translation keeps each claim's role and strength across languages and is tested as a draft would be (rules 26 and 27 of the shipped rules file). Explaining a draft from the draft reproduces its drift in a second form that the author then reads as confirmation; explaining it from the record exposes the drift as a difference between the two.

## The independent check

A full-section draft is a pass that writes or rewrites the draft text of a whole section: the first draft, a redraft the author asks for, a rewrite of a stale section as a whole. A revision that changes some sentences in response to a correction is not one and gets the self-check only.

After a full-section draft has passed the self-check, and before the text is shown as final, dispatch one fresh subagent of the general-purpose type that did not write the draft. It receives only three things, pasted verbatim into its prompt, never summarized: the section's part 3 entry (claims, roles, relations, conditions, the author's verbatim lines), the section's part 4 entry (emphasis and wording notes) together with the corrected pairs from every other section's part 4, since those apply to this section too, and the section's draft text. It receives nothing of the conversation, not the rest of the record, and no account of what the draft was meant to do; the writer's reading of the conversation is what produced any drift, and a reviewer holding only the record compares against the authority.

The dispatch prompt carries these elements, in whatever words fit the section:

- The task: compare the draft against the record for this section and report every mismatch; the reviewer did not write the draft and is not to improve it.
- The two inputs, each under its own heading, with the record first.
- What counts as a mismatch: a claim absent or with a changed role, strength, subject or object; a relation rendered with another sense; a condition absent; a sentence with no claim, relation or kept expression behind it; claims out of order; a rejected addition present under any wording; a struck word present or a kept expression altered. The reviewer treats a sentence it cannot map to a recorded line as a mismatch by default.
- Read-only: it edits nothing and reads no other file.
- The return: a structured list, one item per mismatch, each with three fields: the site (the draft sentence, quoted), what the record says (the recorded line, quoted), what the draft says (the difference in one line). An empty list when it finds none. Only what it found; a line it cannot confirm is reported as not found, not invented. Findings in English, with the draft sentence quoted in the draft's language. Small enough to show the author whole.

Every finding is shown to the author, with its three fields as returned and, for each, your recommended disposition: apply the finding to the draft; keep the draft because the finding misreads the record; or treat the finding as pointing at the record, when the record line itself is what the author would now change, which goes through Revision in `references/drafting.md`. The recommendation sentence is a restatement and passes the restatement check. The draft changes only on the author's word, finding by finding: the author decides each, and may decide several in one message, but no finding is applied because the author accepted its neighbour, and none is applied before the author answers. A finding applied to the draft is followed by the self-check; a finding resolved by changing the record follows Revision. The dispatch and its return are visible in the transcript, so the author can see that the check ran and what it saw.

## The re-comparison at the start of every turn

At the start of every turn, re-read the record and the draft in full and discard what the conversation remembers of them; the author may have edited either by hand since the last turn. The section being worked on is the one the request names; otherwise the section Status lists as last worked on; otherwise none, and nothing is compared.

Run comparisons 1 to 6 of the self-check on that section against its draft text, from a fresh mapping. If they disagree, say so before doing anything else, naming the section, the recorded line and the draft sentence, and then sort the disagreement:

- The record moved: the recorded line carries a replacement note or the section's draft state is `stale`, and the draft still renders the old line. The record wins; the draft stays as it is, the state is `stale` if it was not, and the author is told; a rewrite waits for the author's request.
- The draft moved: the recorded line is unchanged and the draft text differs from it in role, strength, condition, order or content, and the text is not what you wrote for that line. This is a hand edit, handled below.
- Unclear which: ask the author, which is the same question the hand-edit flow asks.

Status flags are hints read against the body: a section marked `drafted` with no text under its heading is `none`; a section marked `none` with text under its heading is `drafted`; a section marked `stale` whose draft matches its logic is `drafted`; a section marked `logic` with no part 3 entry is `plan`. Correct Status in the same turn and name the correction to the author. Only then take up the request.

## Hand edits to the draft

Text in the draft that you did not write and that departs from the record is a correction by the author, made in the draft instead of in conversation. It is never overwritten, never reverted by a self-check, and never "fixed" toward the record: the self-check tests your sentences against the record, not the author's sentences.

Ask the author, naming the edited sentence and the recorded line it departs from, which of two things happened: the record should change to match the edit, or the draft drifted and the edit is the author putting back what was meant. This is the restore-versus-change distinction of `references/existing-manuscript.md`, and the outcome is recorded the same way:

- The record changes: the claim, role, condition, emphasis or wording the edit shows is written into part 3 or part 4 in English, with the edited sentence as the author's verbatim words beside it (or as a kept expression when the author wants those words), with the note of what it replaced, quoted back in the same reply; the dependents procedure of `references/elicit.md` runs for every agreed part that rests on the changed line; the author's sentence stands in the draft as written.
- The draft drifted: the author decides what the draft should say. Their edit is one answer; if they ask for renderings, propose two or three. The pair of wordings, the drifted and the intended, goes under distinctions in part 4 so no later draft slides back. The author's sentence stands unless the author replaces it.

A hand edit that renders the same recorded line with the same role, strength, condition and order is the author's wording and stands without a question; nothing in the record changes. A sentence the author added that renders no recorded line is asked about, not cut: it may be a new claim, which brings its relation and condition as new obligations under `references/elicit.md`, or wording the author wants kept, or a sentence they will drop once asked. The absence test applies to your sentences, not to the author's.
