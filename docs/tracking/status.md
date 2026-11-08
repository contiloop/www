# Status

## Done and verified

- Skill `write`: one source in `src/skills/write/` (`SKILL.md`, eight references), platform-neutral text. `scripts/build.sh` generates the Claude package (`claude/`) and the Codex package (`codex/plugin/`), both committed; `scripts/check.sh` exit 0 including the fresh-build comparison; `claude plugin validate .` passes. Version 0.3.0 installed locally in both Claude Code (`/www:write`) and Codex (`$write`).
- The Codex update path after a version bump (`codex plugin remove www@www && codex plugin add www@www`): exercised on 2026-11-08 for 0.3.0; `codex plugin remove www` without the marketplace suffix is refused.
- Acceptance fixture `tests/ads-introduction/`: three Claude Code runs (0.1.0, 0.1.1, 0.2.0) and one Codex run (0.2.0) on 2026-11-07, each with the mechanical check 6/6 and all five judged conditions passing, the independent-check dispatch confirmed in the session logs. Results in `tests/ads-introduction/results/RESULT.md`.
- README with install for both platforms, use, build, check and test steps. Public repository `github.com/contiloop/www`; both marketplaces can be added as `contiloop/www`.

## Built, not yet verified

- Version 0.3.0: a missing step between two recorded claims and a condition the author did not give are never supplied, in a draft or in a proposal; a line the skill supplied inside a proposal is listed apart and enters the record only when accepted on its own; author remarks are sorted into content remarks (recorded) and understanding remarks (recorded nowhere, never drafted); independent-check findings the record settles (category A) are applied and shown before and after, findings that would move the record (category B) are asked; the reading check as comparison 8 of the self-check; case memory in `~/.claude/www/cases/` with `references/cases.md` and rule 35. Verified by: both fixture runs with the case store moved aside; a live session on a real document showing an understanding remark that enters nothing into parts 1 to 4, a proposal that lists the lines the skill supplied, and one case offer at the end.
- The questioning half: level inference, the three grounds, proposals in alternatives, contradiction and dependents, declined questions. The fixture pre-answers it; it is verified in the author's first live session on a real document.
- The existing-manuscript path, the hand-edit flow in `draft.md`, stale marking and rewrite on request, the whole-document tempo, the user rules file creation and the "wins on conflict" read. Each is specified and read in review; none has been exercised.
- On Codex, the refused write of the user rules file under the default sandbox and the skill's report of it: specified, not exercised (the author's Codex allows the write).

## Remaining, in order

1. Live acceptance of the questioning half on the ADS paper (the author's first real session).
2. The first case: the 2026-11-07 poster-script session, written into `~/.claude/www/cases/` from that session on the author's request.
3. Confirm or correct the three fixture relations whose Korean lines have no connective (C4 → C5, C6 → C7, C11 → C12), currently a pending proposal in the fixture record.
4. Reference-sentence collection: a store of well-written sentences the author gathers, read as the fourth style source in `references/drafting.md`, with its own entry point.
5. Export of `draft.md` to LaTeX or slides.
6. Acceptance fixtures for a report and a presentation.
7. A way to promote an accepted run-time rule from `~/.claude/www/writing-rules.md` into the shipped rules file deliberately.
8. A LICENSE file, needed only for directory submission of the plugin.
9. GitHub Copilot and other Agent Plugins 1.0 hosts: a third package from the same source, when wanted.

## Blockers

None.
