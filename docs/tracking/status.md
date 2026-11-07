# Status

## Done and verified

- Skill `write`: one source in `src/skills/write/` (`SKILL.md`, seven references), platform-neutral text. `scripts/build.sh` generates the Claude package (`claude/`) and the Codex package (`codex/plugin/`), both committed; `scripts/check.sh` exit 0 including the fresh-build comparison; `claude plugin validate .` passes. Version 0.2.0 installed locally in both Claude Code (`/www:write`) and Codex (`$write`).
- Acceptance fixture `tests/ads-introduction/`: three Claude Code runs (0.1.0, 0.1.1, 0.2.0) and one Codex run (0.2.0) on 2026-11-07, each with the mechanical check 6/6 and all five judged conditions passing, the independent-check dispatch confirmed in the session logs. Results in `tests/ads-introduction/results/RESULT.md`.
- README with install for both platforms, use, build, check and test steps. Public repository `github.com/contiloop/www`; both marketplaces can be added as `contiloop/www`.

## Built, not yet verified

- The questioning half: level inference, the three grounds, proposals in alternatives, contradiction and dependents, declined questions. The fixture pre-answers it; it is verified in the author's first live session on a real document.
- The existing-manuscript path, the hand-edit flow in `draft.md`, stale marking and rewrite on request, the whole-document tempo, the user rules file creation and the "wins on conflict" read. Each is specified and read in review; none has been exercised.
- On Codex, the refused write of the user rules file under the default sandbox and the skill's report of it: specified, not exercised (the author's Codex allows the write).
- The Codex update path (`codex plugin remove www && codex plugin add www@www`) after a version bump: documented, not yet exercised; the first Codex install was fresh.

## Remaining, in order

1. Live acceptance of the questioning half on the ADS paper (the author's first real session).
2. Confirm or correct the three fixture relations whose Korean lines have no connective (C4 → C5, C6 → C7, C11 → C12), currently a pending proposal in the fixture record.
3. Reference-sentence collection: a store of well-written sentences the author gathers, read as the fourth style source in `references/drafting.md`, with its own entry point.
4. Export of `draft.md` to LaTeX or slides.
5. Acceptance fixtures for a report and a presentation.
6. A way to promote an accepted run-time rule from `~/.claude/www/writing-rules.md` into the shipped rules file deliberately.
7. A LICENSE file, needed only for directory submission of the plugin.
8. GitHub Copilot and other Agent Plugins 1.0 hosts: a third package from the same source, when wanted.

## Blockers

None.
