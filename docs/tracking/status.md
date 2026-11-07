# Status

## Done and verified

- Plugin `www` with skill `write`: manifests, `SKILL.md`, seven references (`design-format`, `elicit`, `decompose`, `existing-manuscript`, `writing-rules`, `drafting`, `review`). `scripts/check.sh` exit 0; `claude plugin validate .` passes; installed locally with `claude plugin install www@www`.
- Acceptance fixture `tests/ads-introduction/` (record, `RUN.md`, `check.sh`). First headless run on 2026-11-07: mechanical check 6/6, all five judged conditions pass; one independent-check dispatch confirmed in the session log. Result in `tests/ads-introduction/results/RESULT.md`.
- README with install, use, check and test steps.

## Built, not yet verified

- The questioning half: level inference, the three grounds, proposals in alternatives, contradiction and dependents, declined questions. The fixture pre-answers it; it is verified in the author's first live session on a real document.
- The existing-manuscript path, the hand-edit flow in `draft.md`, stale marking and rewrite on request, the whole-document tempo, the user rules file creation and the "wins on conflict" read. Each is specified and read in review; none has been exercised.
- `claude plugin marketplace update www` + `claude plugin update www@www` as the edit-to-installed path: documented, not yet run.

## Remaining, in order

1. Live acceptance of the questioning half on the ADS paper (the author's first real session).
2. Confirm or correct the three fixture relations whose Korean lines have no connective (C4 → C5, C6 → C7, C11 → C12), currently a pending proposal in the fixture record.
3. Reference-sentence collection: a store of well-written sentences the author gathers, read as the fourth style source in `references/drafting.md`, with its own entry point.
4. Export of `draft.md` to LaTeX or slides.
5. Acceptance fixtures for a report and a presentation.
6. A way to promote an accepted run-time rule from `~/.claude/www/writing-rules.md` into the shipped rules file deliberately.
7. A LICENSE file, needed only for directory submission of the plugin.

## Blockers

None.
