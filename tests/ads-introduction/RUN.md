# ADS Introduction test

The fixture is `design.md` in this folder: the record of the author's machine-translation data-selection paper with the Introduction's detailed logic agreed (twelve claims). The test drafts the Introduction from the record and checks that the draft reproduces the twelve claims without added, dropped, weakened or recomposed claims.

## Before the run

The reader and message lines in Overview were given by the author on 2026-11-07 and are filled. One proposal is still pending in Status: the three relations whose Korean line has no connective (C4 → C5, C6 → C7, C11 → C12). The author confirms or renames them in the session's first turn; until then a draft that renders them differently is not a failure.

A headless variant of steps 2 to 6 (one `claude -p` command, stdin from `/dev/null`, the git offer pre-answered in the prompt) is in `docs/operations.md`; it produces the same artifacts.

## Steps (Claude Code)

1. Install the plugin from the repository root (the folder that holds `.claude-plugin/marketplace.json`):

       claude plugin marketplace add <path to the repository root>
       claude plugin install www@www

2. Open a Claude Code session in this folder (`tests/ads-introduction/`).
3. Invoke `/www:write`.
4. Confirm or rename the three pending relations. Check that the skill writes the answer into `design.md` and quotes it back.
5. Ask for a draft of the Introduction.
6. Ask for an explanation of the draft in Korean.
7. Save the draft text to `results/draft.md` and the Korean explanation to `results/explanation.md`.
8. Number the draft's sentences and write `results/mapping.txt`, one line per sentence: `<sentence number> <claim numbers or none>`. A sentence that renders two claims lists both, comma-separated (`3 3,4`). Use `none` for a sentence that states nothing recorded as a claim. Numbering rule, the same one `check.sh` uses: drop Markdown heading lines and blank lines, join the rest, split after `.`, `?` or `!` when followed by whitespace or the end of the text, count from 1. `check.sh` prints the sentences with their numbers; compare them with the mapping before reading its results.
9. Run the mechanical check from this folder:

       sh check.sh results/draft.md results/mapping.txt

   It prints one `ok` or `FAIL` line per check and exits 0 only when all pass.

10. Judge the remaining conditions below and record every result in `results/RESULT.md`: the date, one line per condition with `pass` or `fail`, and for a fail the sentence or transcript passage that shows it.

## Steps (Codex)

1. Install the plugin from the repository root:

       codex plugin marketplace add <path to the repository root>
       codex plugin add www@www

   The first command accepts a local path or `owner/repo`. Codex loads plugins at session start; the independent check needs Codex's multi-agent feature (`multi_agent = true` in `~/.codex/config.toml`).
2. Open a Codex session in this folder and invoke `$write`, then follow steps 4 to 6 of the Claude Code list with the same requests.
3. Headless form, from this folder (the sandbox and approvals are bypassed because the skill writes `design.md` and `draft.md` here and dispatches a subagent; run it only in this version-controlled folder):

       codex exec --dangerously-bypass-approvals-and-sandbox -o results/last-codex.md "$write No need to initialize git here. Keep the three pending relations as written. Draft the Introduction section. After the draft and its checks, give me a Korean explanation of what the draft says." < /dev/null > results/transcript-codex.txt 2>&1

4. Save the artifacts with the `-codex` suffix: `results/draft-codex.md`, `results/explanation-codex.md`, `results/mapping-codex.txt`, and run

       sh check.sh results/draft-codex.md results/mapping-codex.txt

5. Judge the same pass conditions; for the independent check, Codex's session log under `~/.codex/sessions/<year>/<month>/<day>/` holds the subagent call. Record the run in `results/RESULT.md` with the platform named, then restore the fixture (`git checkout -- design.md`, remove `draft.md`).

## Pass conditions

Mechanical, reported by `check.sh`:

- The sentence mapped to claim 3 contains a local-deployment term (`local`, `locally`, `on-premise`, `on-device`) and contains neither `alternative` nor `option`.
- No sentence lies between the sentences mapped to claims 10 and 11.
- No sentence is mapped `none`.
- Every claim 1 to 12 is mapped by at least one sentence.

Judged by the reader:

- The draft states that a small, locally deployable model must be developed because of the cost and security problems of existing services, and states it as a need. Where to look: the sentences mapped to claims 2 and 3 in `results/draft.md`. A sentence saying the model "offers an alternative", "is an option" or "can be useful" fails.
- No sentence between the research question and the introduction of ADS argues why low-QE sentences should be chosen or that the benefit of choosing them must be verified. Where to look: the sentences from the one mapped to claim 10 to the one mapped to claim 12.
- The draft has no caveat, implication, summary or takeaway sentence without a recorded claim behind it. Where to look: every sentence of `results/draft.md` against the twelve claims in `design.md`, part 3; the mapping records the judgment sentence by sentence.
- The Korean explanation contains no claim absent from `design.md`; in particular it does not say that small models are useful (유용하다). Where to look: every sentence of `results/explanation.md` against parts 1 to 4 of `design.md`.
- The self-check ran before the draft was shown and the independent check ran after it, and both are visible in the transcript. Where to look: the session transcript between the request for the draft and the draft text (self-check), and after the draft text (independent check).

## Results

`results/RESULT.md` holds the date, `pass` or `fail` per condition (the four mechanical ones copied from the `check.sh` output, the five judged ones from the reader), and the evidence for each fail. `results/draft.md`, `results/explanation.md` and `results/mapping.txt` stay beside it.
