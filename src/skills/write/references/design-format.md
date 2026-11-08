# The record: `design.md`

The record is the file the author owns and the authority every draft, check and restatement is compared against. The conversation is where things get settled; the record is where they exist. If the two disagree, the record wins, and the record is written in English whatever language the author discusses in.

## Shape

Five top-level parts, in this order, with these headings. Headings below them are shaped per document; the five are not renamed, merged, reordered or added to.

```
# <document title>
## 1 Overview
## 2 Structure and section plans
## 3 Detailed logic
## 4 Emphasis and wording
## 5 Status
```

Parts 1 to 4 hold only what the author has accepted. Part 5 holds everything that is pending, declined or about the state of the work.

### 1 Overview

One entry each: the document type, whose line names one of `presentation script`, `research paper`, `report`, `essay` or `other` and may say more after it (the name, with its space as a hyphen, is the `<type>` of `references/types/<type>.md`); the reader and the venue and what that reader will judge from the text; the central topic; the message the document must leave the reader with; the Progression. The Progression is the chain of the document as a whole: the line `- Progression:`, then one step per line, indented, the first step bare and every later step beginning with `→ by <relation> `, the relation one of the six part 3 uses: cause, contrast, condition, consequence, question/answer, elaboration.

```
- Progression:
    <first step>
    → by <relation> <next step>
    → by <relation> <next step>
```

A step is a claim-sized statement, not a section title; a step may span sections and a section may contribute no step, which is why the Progression is not a table of contents. A join carries its relation alone; the condition under which it holds is settled in part 3. Whether a Progression has this shape is judged by its joins and the relations they name, not by its line breaks: a Progression the author typed on one line with each relation named passes, while what the skill itself writes is one step per line. The steps and joins are proposed and written only once the author accepts them; a Progression is never filled in from the section list to satisfy the shape.

A step whose join has not yet been asked or answered stands on its own line with no arrow; the record check lists that join as an open question until it carries a relation or the declined mark. A join the author declines is marked, not left blank. When the author, asked for the relation between two steps, says there is none or declines to give one, the step line begins `→ (declined) ` in place of `→ by <relation> `, in part 1 and in part 2 alike; the question is listed in Status with `— declined`; and the draft renders that boundary as two sentences side by side with no connective, as a relation the record does not draw. A declined join does not hold up what lies below it: the section's unfolding and its claims are still worked out on both sides of it.

### 2 Structure and section plans

The ordered list of sections. Under each, what the section covers, then its unfolding: an indented `Unfolds:` line followed by one step per line in the shape of the Progression, the first step bare and each later step beginning with `→ by <relation> ` or `→ (declined) `.

```
1. <section> — <what it covers>
    Unfolds:
    <first step>
    → by <relation> <next step>
```

An unfolding is coarser than the section's part 3 entry: its steps are the Progression's steps that fall in the section, or steps of that size, and each step groups the claims that part 3 later details under it. A list of the topics the section touches, or steps joined by arrows with no relation named, is what the section covers and not an unfolding. The join from the last step of one section to the first step of the next is written in the Progression only; a section's unfolding starts at its first step with no leading arrow. A section whose plan is agreed and whose logic is not still appears here; its part 3 entry is simply absent.

### 3 Detailed logic

One subsection per section, same order as part 2. Each holds numbered claims and the relation between neighbors:

```
C1 (need) <the claim as one English line>
    author: <the author's words, verbatim>
  → C2 by <relation>, holds when <the condition>
C2 (cause) ...
```

A claim's role is one of `need`, `cause`, `judgment`, `question`, `proposal`, `description`. The relation carrying a claim to the next is one of `cause`, `contrast`, `condition`, `consequence`, `question/answer`, `elaboration`. An `elaboration` says the next claim tells more about the one before it, a detail, a definition, an example or the way something works, and the argument takes no step; it is the relation to offer, as a proposal the author accepts, for two sentences the author wrote with no connective where the second only tells more about the first, and having it keeps a `condition` or a `cause` from being supplied where the author drew none; a pair the author says has no relation takes the declined mark. The condition is the fact that makes the relation hold; when the author states a relation without one, write the relation alone rather than a condition the author did not give. The role is recorded as the author stated it: a claim the author voiced as a necessity is a `need` even when a softer role would read more naturally, and a `judgment` is not promoted to a `cause` because the chain would then look tighter.

Part 3 inherits the joins of part 2. The relation between the last claim of one part-2 step and the first claim of the next step is the relation the unfolding records, written again here in this part's notation with whatever condition the author gives for it; at a declined join the line reads `→ C<n> (declined)`, so every pair of neighbouring claims keeps its relation line. The relations between claims inside one step are settled here, since the unfolding says nothing about them. A claim that no step covers, an opening remark before the first step, takes its relation to the next claim here alone. When the author, working at this level, gives a relation at a step boundary other than the one the unfolding records, that is a contradiction, not a part 3 detail: the part 2 line changes with its replacement note and the dependents procedure of `references/elicit.md` runs.

### 4 Emphasis and wording

One subsection per section, each with whichever of these groups has content: conditions that must survive in the text; claims to emphasize; distinctions in meaning, written as the corrected pair, `"<rejected word>" → "<required word>"`; expressions the author wants kept, verbatim and in the document's language; additions the author rejected, named specifically enough that a later draft recognizes the same sentence under different wording; candidate logics the author rejected, as a one-line description of the chain, so they are not proposed again. A group with nothing in it is omitted, not written as "none".

### 5 Status

Fixed fields:

```
document: type <agreed|open>, reader-and-topic <agreed|open>, structure <agreed|open>
sections:
  <section name>: level <none|plan|logic|wording>, draft <none|drafted|stale>
last worked on: <section name, or none>
open questions:
  - <the question, where in the document it lands, what goes wrong in the text while it is open>
  - <a question the author declined> — declined
proposals:
  - <what is proposed and for which part and section>, alternatives: <A> / <B> / <C>, recommended <one>
```

`structure` is `agreed` only when part 1 holds a Progression in the shape above and part 2 lists the ordered sections, each with what it covers; sections the author has ordered without a Progression leave `structure` at `open`. `level` is the highest level the author has accepted for that section, from the exact set `none | plan | logic | wording`. A section is at `plan` only when its part 2 entry has both what it covers and an unfolding in the shape above; a section whose entry has what it covers and no unfolding is at `none`, and its list stays in part 2 as what it covers. A record whose Status says `plan` for such a section is corrected to `none` at the next entry under the reading rule below, with nothing else in the record changed. `draft` is `none` until the section has draft text, `drafted` once it has, `stale` once a line in parts 1 to 4 for that section (or a document-wide line the section rests on) changed after the draft was written. A `stale` draft is rewritten only when the author asks; the flag and a sentence telling the author are the whole response to the change.

A question the author declines to answer stays listed with `— declined` and is not asked again in any wording; the gap it leaves is worked around, and a draft that depends on it is shown with the gap named. A question the author answered is removed, and the answer goes into its part (or into a new proposal). Open questions and proposals are written so that a reader who has never seen the conversation can act on them.

## Writing into the record

- A statement enters parts 1 to 4 only after the author accepts it. The author's own content remark, made without the AI's prompting, is accepted by being made (`references/elicit.md` separates a content remark from an understanding remark, which enters nothing); an AI proposal is accepted only by the author's word. Until then it stays under `proposals` in Status, with its alternatives, and nothing drafted rests on it.
- A proposal the author rejects is recorded under rejected additions or rejected logics in part 4 when a later draft or a later proposal could otherwise bring it back; a rejected alternative that nothing would reintroduce is simply removed from Status.
- Every line written into parts 1 to 4 is quoted back in the same reply: the English line, and beside it the author's words, so the author can object before working on top of it. The quote-back is the whole of what was written, not a summary of it.
- The author's words are kept verbatim beside the English line whenever the author's statement was not already that English line. "Verbatim" means the sentence the author typed, in the author's language, with its particles and hedges; a cleaned-up or translated version beside the English line defeats the purpose, which is to let the author see where the English departed from what they said. When the author typed the English line itself, the `author:` line is omitted.
- When an accepted change replaces an earlier line, the new line is written in place of the old one and carries a short note of what it replaced: `(replaces: <the old line, shortened to its distinguishing words>)`. The note lets a reader of a later draft see why wording moved; it is not a history, so one note per line, the most recent replacement only.
- A reason is recorded only when the author gave one and a later reader of the record could not work it out from the record itself. A reason the author did not state is not written even when it seems obvious; a reason the author stated but which the surrounding lines already make plain is not written either. Reasons are written as content, in the same voice as the line they support, never as a parenthetical attributing them to the author.
- No provenance tags on any line (no "author said", "AI proposed", "accepted on turn 7"), no transcript of questions and their answers, no reasoning the author did not state. The record holds the design, not the process that produced it; the process is recoverable from the conversation and from git in the document folder when the author chose to initialize it.
- Everything in the record is in English except two things: the author's verbatim words, and expressions the author wants kept, which stay in the document's language.

## Reading the record

The author may edit the file by hand at any time, so the record is re-read in full at the start of every turn and the conversation's memory of it is discarded. Status is read as the author's and the AI's best note of where things stand, not as truth: a section marked `logic` whose part 3 entry is missing is treated as `plan` when its part 2 entry has an unfolding and as `none` when it has not; a section marked `plan` whose part 2 entry has no unfolding is treated as `none`; a section marked `drafted` whose draft text no longer matches its logic is reported as a disagreement before anything else is done. When Status and the body disagree, the body is right and Status is corrected in the same turn, with the correction named to the author.

When a line in parts 1 to 4 changes, every other agreed line that rests on it (the overview message, other sections' claims, emphasis notes) is listed for the author with a question about each; none is edited on the AI's own judgment, and the sections whose drafts rest on the changed line go to `stale`.

## Abridged example

A short internal report, two sections, after the first section's logic was agreed and drafted and then one line was changed.

```
# Night backup report

## 1 Overview
- Type: internal report, two pages, for the operations lead
- Reader: the operations lead; will judge whether to approve the change this week
- Topic: moving the file-server backup from weekly to nightly
- Message: the nightly backup must be approved now, because a week of work is at risk every day
- Progression:
    the weekly backup leaves up to six days of work unprotected
    → by consequence the April incident cost four days of work
    → by cause a nightly backup must be approved now, as a necessity and not an improvement
    → by contrast the cost is one disk and twenty minutes of setup

## 2 Structure and section plans
1. Risk — what the current schedule leaves exposed and what it has already cost
    Unfolds:
    the weekly backup leaves up to six days of work unprotected
    → by consequence the April incident cost four days of work
    → by cause a nightly backup must be approved now, as a necessity and not an improvement
2. Proposal — the nightly schedule, its cost, and the approval asked for
    Unfolds:
    the cost is one disk and twenty minutes of setup
    → (declined) the approval is asked for this week

## 3 Detailed logic
### Risk
C1 (description) The file server is backed up once a week, on Sunday night.
  → C2 by consequence, holds when work saved between backups is not stored anywhere else
C2 (judgment) Up to six days of work are unprotected at any time.
    author: 백업 사이에 최대 6일치 작업이 아무 보호도 못 받고 있어요
  → C3 by consequence
C3 (description) In April one incident cost four days of work.
  → C4 by cause
C4 (need) A nightly backup must be approved now. (replaces: a nightly backup should be considered)
    author: 지금 승인받아야 해요. 검토할 일이 아니라

## 4 Emphasis and wording
### Risk
- Distinction: "should be considered" → "must be approved"
- Keep: "a week of work is at risk every day"
- Rejected addition: a sentence comparing the cost of backup disks with cloud storage
- Rejected logic: opening with the April incident and deriving the exposure from it

## 5 Status
document: type agreed, reader-and-topic agreed, structure agreed
sections:
  Risk: level logic, draft stale
  Proposal: level plan, draft none
last worked on: Risk
open questions:
  - Whether the April incident is named with its date or only as "an incident this spring"; lands in Risk, C3; without it the draft cannot say how recent the loss was — declined
  - The relation between the cost and the request for approval; lands in Proposal, at the join of its two steps; the draft sets the two side by side with no connective — declined
proposals:
  - Proposal section, detailed logic: (A) the disk's price and the setup time as two claims, each carried to the request; (B) one claim for the whole cost, then the request; recommended B
```

The `Risk` draft is `stale` because C4 was replaced after the section was drafted; the draft is not rewritten until the author asks. The relations C2 → C3 and C3 → C4 are the joins the `Risk` unfolding records, written again in part 3; C1 → C2 lies inside the first step and was settled in part 3 alone. The declined question about the date is kept so it is not asked again, and the draft will name the incident without a date; the declined join in `Proposal` is kept the same way, and its draft, when written, puts the cost and the request side by side with no connective. Both proposals for `Proposal` detail the steps its unfolding fixes; neither is in part 3 until the author accepts it, and no draft of `Proposal` is written before that.
