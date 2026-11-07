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
