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
