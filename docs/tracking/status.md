# Status

## Done and verified

- Skill `write`: one source in `src/skills/write/` (`SKILL.md`, seven references and `types/`), platform-neutral text. `scripts/build.sh` generates the Claude package (`claude/`) and the Codex package (`codex/plugin/`), both committed; `scripts/check.sh` exit 0 including the fresh-build comparison; `claude plugin validate .` passes. Version 0.4.0 installed locally in both Claude Code (`/www:write`) and Codex (`$write`).
- The Codex update path after a version bump (`codex plugin remove www@www && codex plugin add www@www`): exercised on 2026-11-08 for 0.3.0; `codex plugin remove www` without the marketplace suffix is refused.
- Acceptance fixture `tests/ads-introduction/`: three Claude Code runs (0.1.0, 0.1.1, 0.2.0) and one Codex run (0.2.0) on 2026-11-07, two Claude Code runs and two Codex runs on 0.3.0 and one of each on 0.4.0 on 2026-11-08, each with the mechanical check 6/6 and all five judged conditions passing, the independent-check dispatch confirmed in the session logs. Results in `tests/ads-introduction/results/RESULT.md`.
- README with install for both platforms, use, build, check and test steps. Public repository `github.com/contiloop/www`; both marketplaces can be added as `contiloop/www`.

## Built, not yet verified

- Version 0.4.0: one rules file per document type under `references/types/` (`presentation-script.md`, `research-paper.md`, `report.md`, `essay.md`), read with `writing-rules.md` when the record's type line names the type and winning on conflict; a rule the author accepts while writing enters the document's part 4 and is shown as the line for the repository's rules file or type file; the skill writes `design.md` and `draft.md` only; the user rules file and the case store of 0.3.0 are gone. Carried from 0.3.0 and still to be seen live: no missing step or condition supplied, in a draft or a proposal; a line the skill supplied inside a proposal listed apart and accepted on its own; content remarks recorded and understanding remarks recorded nowhere; category A findings applied and shown before and after, category B findings asked; the reading check as comparison 8. Verified by: a live session on a real document in which an accepted rule is recorded in part 4 and shown as a repository line, a presentation script's record makes the skill read `types/presentation-script.md` and name it, an understanding remark enters nothing into parts 1 to 4, and a proposal lists the lines the skill supplied.
- The questioning half: level inference, the three grounds, proposals in alternatives, contradiction and dependents, declined questions. The fixture pre-answers it; it is verified in the author's first live session on a real document.
- The existing-manuscript path, the hand-edit flow in `draft.md`, stale marking and rewrite on request, the whole-document tempo. Each is specified and read in review; none has been exercised.

## Remaining, in order

1. Live acceptance of the questioning half on the ADS paper (the author's first real session).
2. Fill the type rules files from the author's documents as rules are accepted: each `references/types/<type>.md` holds only its opening paragraph, so today a type file changes nothing in a draft.
3. Confirm or correct the three fixture relations whose Korean lines have no connective (C4 → C5, C6 → C7, C11 → C12), currently a pending proposal in the fixture record.
4. Reference-sentence collection: a store of well-written sentences the author gathers, read as the fourth style source in `references/drafting.md`, with its own entry point.
5. Export of `draft.md` to LaTeX or slides.
6. Acceptance fixtures for a report and a presentation.
7. A LICENSE file, needed only for directory submission of the plugin.
8. GitHub Copilot and other Agent Plugins 1.0 hosts: a third package from the same source, when wanted.

## Blockers

None.
