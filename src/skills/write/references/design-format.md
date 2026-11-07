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

One entry each: the document type; the reader and the venue and what that reader will judge from the text; the central topic; the message the document must leave the reader with; the overall logical progression in a few lines. The progression is the chain of the document as a whole, one line per step, not a table of contents.

### 2 Structure and section plans

The ordered list of sections. Under each, what the section covers and how its content unfolds from its first claim to its last. A section whose plan is agreed and whose logic is not still appears here; its part 3 entry is simply absent.

### 3 Detailed logic

One subsection per section, same order as part 2. Each holds numbered claims and the relation between neighbors:

```
C1 (need) <the claim as one English line>
    author: <the author's words, verbatim>
  → C2 by <relation>, holds when <the condition>
C2 (cause) ...
```

A claim's role is one of `need`, `cause`, `judgment`, `question`, `proposal`, `description`. The relation carrying a claim to the next is one of `cause`, `contrast`, `condition`, `consequence`, `question/answer`. The condition is the fact that makes the relation hold; when the author states a relation without one, write the relation alone rather than a condition the author did not give. The role is recorded as the author stated it: a claim the author voiced as a necessity is a `need` even when a softer role would read more naturally, and a `judgment` is not promoted to a `cause` because the chain would then look tighter.

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

`level` is the highest level the author has accepted for that section, from the exact set `none | plan | logic | wording`. `draft` is `none` until the section has draft text, `drafted` once it has, `stale` once a line in parts 1 to 4 for that section (or a document-wide line the section rests on) changed after the draft was written. A `stale` draft is rewritten only when the author asks; the flag and a sentence telling the author are the whole response to the change.

A question the author declines to answer stays listed with `— declined` and is not asked again in any wording; the gap it leaves is worked around, and a draft that depends on it is shown with the gap named. A question the author answered is removed, and the answer goes into its part (or into a new proposal). Open questions and proposals are written so that a reader who has never seen the conversation can act on them.

## Writing into the record

- A statement enters parts 1 to 4 only after the author accepts it. The author's own statement, made without the AI's prompting, is accepted by being made; an AI proposal is accepted only by the author's word. Until then it stays under `proposals` in Status, with its alternatives, and nothing drafted rests on it.
- A proposal the author rejects is recorded under rejected additions or rejected logics in part 4 when a later draft or a later proposal could otherwise bring it back; a rejected alternative that nothing would reintroduce is simply removed from Status.
- Every line written into parts 1 to 4 is quoted back in the same reply: the English line, and beside it the author's words, so the author can object before working on top of it. The quote-back is the whole of what was written, not a summary of it.
- The author's words are kept verbatim beside the English line whenever the author's statement was not already that English line. "Verbatim" means the sentence the author typed, in the author's language, with its particles and hedges; a cleaned-up or translated version beside the English line defeats the purpose, which is to let the author see where the English departed from what they said. When the author typed the English line itself, the `author:` line is omitted.
- When an accepted change replaces an earlier line, the new line is written in place of the old one and carries a short note of what it replaced: `(replaces: <the old line, shortened to its distinguishing words>)`. The note lets a reader of a later draft see why wording moved; it is not a history, so one note per line, the most recent replacement only.
- A reason is recorded only when the author gave one and a later reader of the record could not work it out from the record itself. A reason the author did not state is not written even when it seems obvious; a reason the author stated but which the surrounding lines already make plain is not written either. Reasons are written as content, in the same voice as the line they support, never as a parenthetical attributing them to the author.
- No provenance tags on any line (no "author said", "AI proposed", "accepted on turn 7"), no transcript of questions and their answers, no reasoning the author did not state. The record holds the design, not the process that produced it; the process is recoverable from the conversation and from git in the document folder when the author chose to initialize it.
- Everything in the record is in English except two things: the author's verbatim words, and expressions the author wants kept, which stay in the document's language.

## Reading the record

The author may edit the file by hand at any time, so the record is re-read in full at the start of every turn and the conversation's memory of it is discarded. Status is read as the author's and the AI's best note of where things stand, not as truth: a section marked `logic` whose part 3 entry is missing is treated as `plan`; a section marked `drafted` whose draft text no longer matches its logic is reported as a disagreement before anything else is done. When Status and the body disagree, the body is right and Status is corrected in the same turn, with the correction named to the author.

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
- Progression: weekly backup leaves up to six days unprotected → one incident already cost four days → nightly backup is a necessity, not an improvement → the cost is one disk and twenty minutes of setup

## 2 Structure and section plans
1. Risk — what the current schedule leaves exposed, ending on the April incident
2. Proposal — the nightly schedule, its cost, and the approval asked for

## 3 Detailed logic
### Risk
C1 (description) The file server is backed up once a week, on Sunday night.
  → C2 by consequence, holds when work saved between backups is not stored anywhere else
C2 (judgment) Up to six days of work are unprotected at any time.
    author: 백업 사이에 최대 6일치 작업이 아무 보호도 못 받고 있어요
  → C3 by cause
C3 (need) A nightly backup must be approved now. (replaces: a nightly backup should be considered)
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
  - Whether the April incident is named with its date or only as "an incident this spring"; lands in Risk, C2; without it the draft cannot say how recent the loss was — declined
proposals:
  - Proposal section, detailed logic: (A) cost first, then schedule, then the request; (B) schedule first, then the request, cost as the closing condition; recommended B
```

The `Risk` draft is `stale` because C3 was replaced after the section was drafted; the draft is not rewritten until the author asks. The declined question is kept so it is not asked again, and the draft will name the incident without a date. Proposal B is not in part 3 until the author accepts it, and no draft of `Proposal` is written before that.
