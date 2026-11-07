# Status

## Done and verified

- Skill `write`: one source in `src/skills/write/` (`SKILL.md`, seven references), platform-neutral text. `scripts/build.sh` generates the Claude package (`claude/`) and the Codex package (`codex/plugin/`), both committed; `scripts/check.sh` exit 0 including the fresh-build comparison; `claude plugin validate .` passes. Version 0.2.0 installed locally in both Claude Code (`/www:write`) and Codex (`$write`).
- Acceptance fixture `tests/ads-introduction/`: three Claude Code runs (0.1.0, 0.1.1, 0.2.0) and one Codex run (0.2.0) on 2026-11-07, each with the mechanical check 6/6 and all five judged conditions passing, the independent-check dispatch confirmed in the session logs. Results in `tests/ads-introduction/results/RESULT.md`.
- README with install for both platforms, use, build, check and test steps.

## Built, not yet verified

- The questioning half: level inference, the three grounds, proposals in alternatives, contradiction and dependents, declined questions. The fixture pre-answers it; it is verified in the author's first live session on a real document.
- The existing-manuscript path, the hand-edit flow in `draft.md`, stale marking and rewrite on request, the whole-document tempo, the user rules file creation and the "wins on conflict" read. Each is specified and read in review; none has been exercised.
- The Codex update path (`codex plugin remove www && codex plugin add www@www`) after a version bump: documented, not yet exercised; the first Codex install was fresh.

## Remaining, in order

1. Live acceptance of the questioning half on the ADS paper (the author's first real session).
2. Confirm or correct the three fixture relations whose Korean lines have no connective (C4 → C5, C6 → C7, C11 → C12), currently a pending proposal in the fixture record.
3. A GitHub remote, so both marketplaces can be added by repository instead of local path.
4. Reference-sentence collection: a store of well-written sentences the author gathers, read as the fourth style source in `references/drafting.md`, with its own entry point.
5. Export of `draft.md` to LaTeX or slides.
6. Acceptance fixtures for a report and a presentation.
7. A way to promote an accepted run-time rule from `~/.claude/www/writing-rules.md` into the shipped rules file deliberately.
8. A LICENSE file, needed only for directory submission of the plugin.
9. GitHub Copilot and other Agent Plugins 1.0 hosts: a third package from the same source, when wanted.

## Blockers

None.
