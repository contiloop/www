# Result: 2026-11-07

Run: headless (`claude -p --dangerously-skip-permissions`) in this folder with the plugin installed from the repository; prompt: `/www:write` with no git initialization, draft the Introduction, then a Korean explanation. Transcript in `transcript.txt`; draft in `draft.md`; explanation in `explanation.md`; mapping in `mapping.txt`.

Mechanical (`check.sh`): pass on all six lines (12 sentences mapped 1 to 12; claim 3 sentence contains "locally" and neither "alternative" nor "option"; no sentence between claims 10 and 11).

Judged:
- Claim 3 as a need with the local condition: pass ("small, domain-specific translation models that can run locally must be developed").
- No justification between the research question and ADS: pass (sentence 11 follows sentence 10 directly).
- No caveat, implication, summary or takeaway without a claim: pass (every sentence maps to one claim).
- Korean explanation contains no claim absent from the record: pass (twelve claims restated; the extra lines under 3, 10 and 11 describe how the draft rendered them, not new claims; "useful" absent).
- Self-check before showing and independent check after: pass (both reported in the reply; the session log shows one subagent dispatch).

Review of the skill files for hardcoded question lists and document-type templates (spec verification item 1): none found in `SKILL.md` or the seven references.

Not covered by this run: the questioning half (reader and message lines were given to the fixture before the run), the stale and hand-edit flows, the manuscript path. The record's Status was changed by the run (Introduction draft `drafted`) and `draft.md` was written in this folder; both were restored so the fixture can be rerun.

# Result: 2026-11-07, second run (plugin 0.1.1, after the review fixes)

Same headless command, with "keep the three pending relations as written" added to the prompt. Transcript `transcript-2.txt`, draft `draft-2.md`, mapping `mapping-2.txt`.

Mechanical: pass on all six lines. Judged: all five pass as in the first run. The independent check returned one finding this time (sentence 2 renders "existing services" as "existing translation services"); the skill showed it with a recommendation and left the draft unchanged pending the author's word, which is the specified handling. The session log shows two subagent dispatches (the independent check, plus one more; the transcript names only the check).

# Result: 2026-11-07, Claude Code run on plugin 0.2.0 (single-source build)

Same headless command. Transcript `transcript-3.txt`, draft `draft-3.md`, mapping `mapping-3.txt`, explanation `explanation-3.md`. Mechanical: pass on all six lines (10 sentences; sentences 4 and 6 each render two claims, mapped `4,5` and `7,8`). Judged: all five pass. The independent check returned two findings about unmarked relations (C6 → C7, C11 → C12), each shown with a recommendation to keep the draft because the author's lines carry no connective; nothing was changed without the author's word. Two subagent dispatches in the session log.

# Result: 2026-11-07, Codex run on plugin 0.2.0

Command: `codex exec --dangerously-bypass-approvals-and-sandbox -o results/last-codex.md '$write ...'` with the same request, in this folder, plugin installed from this repository (`codex plugin marketplace add`, `codex plugin add www@www`). Transcript `transcript-codex.txt`, draft `draft-codex.md`, mapping `mapping-codex.txt`, explanation `explanation-codex.md`.

Mechanical: pass on all six lines (12 sentences mapped 1 to 12). Judged: all five pass. The draft keeps "must be developed" with "can run locally"; sentence 11 follows the research question directly; every sentence renders one claim; the Korean explanation restates the record paragraph by paragraph and adds no claim, no "유용". The self-check and the independent check are both reported in the reply; the Codex session log (`~/.codex/sessions/2026/11/07/rollout-2026-11-07T18-45-25-*.jsonl`) shows one `spawn_agent` call with two `wait_agent` calls. The skill also ran the fixture's `check.sh` on its own draft before showing it.

# Result: 2026-11-08, Claude Code run on plugin 0.3.0 (applied findings, reading check, case store)

Same headless command, with no case store present (`~/.claude/www/` does not exist on this machine). Transcript `transcript-4.txt`, draft `draft-4.md`, mapping `mapping-4.txt`, explanation `explanation-4.md`.

Mechanical: pass on all six lines (11 sentences; sentence 5 renders claims 5 and 6, mapped `5,6`). Judged: all five pass. Claim 3 is a need with "can run locally" and neither "alternative" nor "option"; sentence 10 follows the research question directly; every sentence renders a recorded claim; the Korean explanation restates the twelve claims and adds none, "유용" absent; the self-check is reported before the draft and the independent check after it, with one subagent dispatch in the session log.

New in 0.3.0, as specified: the independent check returned one finding (C6 → C7 rendered as succession, "of this kind" without recorded words); the skill classified it as settled by the record, applied it before showing the text, showed the whole paragraph before and after with the reason in one line, reported that the self-check ran again, and asked whether the author objects. No finding waited for approval, and no finding that would move the record occurred in this run, so the question path for that category is not exercised here. The pending proposal on the three relations was removed from Status at the author's instruction and nothing entered parts 1 to 4.

# Result: 2026-11-08, Codex run on plugin 0.3.0

Same `codex exec` command, no case store present. Transcript `transcript-codex-2.txt`, last message `last-codex-2.md`, draft `draft-codex-2.md`, mapping `mapping-codex-2.txt`, explanation `explanation-codex-2.md`.

Mechanical: pass on all six lines (12 sentences mapped 1 to 12). Judged: all five pass. Claim 3 is a need with "can run locally"; the ADS sentence follows the research question directly; every sentence renders one claim; the Korean explanation restates the record and adds no claim, "유용" absent; the reply reports the self-check and the independent check, and the Codex session log (`~/.codex/sessions/2026/11/08/rollout-2026-11-08T14-57-02-*.jsonl`) shows the `spawn_agent` call. The independent check returned no finding, so neither category's handling is exercised in this run. The draft's section heading is `#` rather than the `##` the draft contract states; recorded in `docs/tracking/findings.md`.

# Result: 2026-11-08, Claude Code rerun on plugin 0.3.0 after the review fixes

Same command, after the final review's fixes to `review.md`, `elicit.md`, `drafting.md` and `SKILL.md` were installed. Transcript `transcript-5.txt`, draft `draft-5.md`, mapping `mapping-5.txt`, explanation `explanation-5.md`.

Mechanical: pass on all six lines (12 sentences mapped 1 to 12). Judged: all five pass. The independent check returned two findings the record settles (a clause with no recorded line that also misdirected "since"; "existing translation services" narrowing C2's "existing services"); both were applied before the text was shown, the first as the whole paragraph before and after, the second as the sentence before and after, each with its reason, followed by the whole section and the question whether the author objects. One subagent dispatch in the session log. The draft's section heading is `#`, as in the Codex run (see `docs/tracking/findings.md`).

# Result: 2026-11-08, Codex rerun on plugin 0.3.0 after the review fixes

Same `codex exec` command with the reviewed text installed. Transcript `transcript-codex-3.txt`, last message `last-codex-3.md`, draft `draft-codex-3.md`, mapping `mapping-codex-3.txt`, explanation `explanation-codex-3.md`.

Mechanical: pass on all six lines (11 sentences; sentence 6 renders claims 6 and 7, mapped `6,7`). Judged: all five pass. The independent check returned no finding; the reply reports both checks and the session log shows the `spawn_agent` call. The section heading is `#` again (findings file).

# Result: 2026-11-08, Claude Code and Codex runs on plugin 0.4.0 (type rules files)

Same commands; the record's type line names a research paper, so both runs read `references/types/research-paper.md` (visible in both session logs) beside the shipped rules file. Claude Code: transcript `transcript-6.txt`, draft `draft-6.md`, mapping `mapping-6.txt`, explanation `explanation-6.md`. Codex: `transcript-codex-4.txt`, `last-codex-4.md`, `draft-codex-4.md`, `mapping-codex-4.txt`, `explanation-codex-4.md`.

Mechanical: pass on all six lines in both (Claude 11 sentences, sentence 4 mapped `4,5`; Codex 12 sentences). Judged: all five pass in both. Claude Code's independent check returned four findings: two the record settles, applied and shown as the sentence before and after with the reason; two that would move the record ("the small model" where the author's lines say student, in C9 and C12), shown as questions with alternatives and left unapplied, which is the first run to exercise that category. One subagent dispatch in the Claude log, one `spawn_agent` in the Codex log. Codex's section heading is `#` again (findings file).

# Result: 2026-11-08, Claude Code and Codex runs on plugin 0.4.2 (the chain top down, record check)

Same commands. The fixture record now carries a Progression with six named relations and an `Unfolds:` block for the Introduction, and four sections at level `none`, so the descent rule is satisfied and neither run proposed an upper chain. Claude Code: `transcript-7.txt`, `draft-7.md`, `mapping-7.txt`, `explanation-7.md`. Codex: `transcript-codex-5.txt`, `last-codex-5.md`, `draft-codex-5.md`, `mapping-codex-5.txt`, `explanation-codex-5.md`.

Mechanical: pass on all six lines in both (Claude 11 sentences, sentence 4 mapped `4,5`; Codex 12 sentences). Judged: all five pass in both. Claude Code's independent check returned four findings the record settles, applied and shown as the whole section before and after with a one-line reason each; it also opened a question in Status about calling the model "the student" (the author's lines say student, no recorded line ties it to C3's model) and drafted "the model" meanwhile. One subagent dispatch in the Claude log; one `spawn_agent` in the Codex log. Neither run wrote into the Progression or a section plan, and the per-turn record check found no departure, so no record-check line appears; Status after the runs kept the four `none` levels. Codex's heading is `#` again (findings file).

# Result: 2026-11-08, Claude Code run on plugin 0.4.3 (elaboration as a relation kind)

Same command. Transcript `transcript-8.txt`, draft `draft-8.md`, mapping `mapping-8.txt`, explanation `explanation-8.md`. Mechanical: pass on all six lines (12 sentences mapped 1 to 12). Judged: all five pass. The reply carries the record check's line ("the Progression and the Introduction's unfolding carry a relation at every join; nothing departs") beside the quote-back of the three confirmed relations. The independent check returned three findings the record settles, applied and shown with the whole paragraph before and after; one of them restored the author's term "student" that the first pass had replaced. Two subagent dispatches in the session log.

The Codex run of 0.4.3 could not start: `codex exec` returned "You've hit your usage limit … try again at 7:57 PM" before the skill ran. It is rerun when the limit lifts.
