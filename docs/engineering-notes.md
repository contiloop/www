# Engineering notes

- Symptom: an edit to a reference file has no effect in `/www:write` or `$write`, and the updater says the plugin is already at the latest version. Cause: both tools run from an installed snapshot (`~/.claude/plugins/cache/www/www/<version>/`, `~/.codex/plugins/cache/www/www/<version>/`) and compare the manifest version, not file contents. Response: raise the version in the three `platform/` manifests, rebuild, then update (Claude: `claude plugin marketplace update www && claude plugin update www@www`; Codex: `codex plugin remove www@www && codex plugin add www@www`); verify with `diff -q` against the cache path. Old version folders stay in the caches.

- Symptom: an edit made in `claude/skills/write/...` or `codex/plugin/skills/write/...` disappears. Cause: those folders are build outputs; `scripts/build.sh` replaces them whole and `scripts/check.sh` fails while they differ from a fresh build. Response: edit `src/skills/write/` and rebuild.

- Symptom: a headless Codex run receives a prompt with the skill name missing. Cause: `$write` inside double quotes is expanded by the shell as an empty variable. Response: single-quote the prompt.

- Symptom: `codex plugin marketplace list` fails with "marketplace root does not contain a supported manifest" for an unrelated marketplace, yet `codex plugin marketplace add` and `codex plugin add` for this repository succeed. Cause: the list command loads every configured marketplace and stops at the first broken one; add and install touch only the named one. Response: ignore for installing; remove the broken entry (`codex plugin marketplace remove <name>`) to make `list` work again.

- How to confirm the independent check ran in a headless Codex run: the session log is `~/.codex/sessions/<year>/<month>/<day>/rollout-<timestamp>-<id>.jsonl`; `grep -c spawn_agent <log>` is non-zero when a subagent was dispatched. The Codex skill also ran the fixture's own `check.sh` before showing the draft, because the script sits in the folder; this is harmless but means the reply's "mechanical check passed" line comes from the skill, not from the reader.

- Symptom: a headless run (`claude -p`) prints "no stdin data received in 3s" and waits. Cause: `-p` reads a prompt from stdin when stdin is a terminal or an open pipe. Response: redirect stdin from `/dev/null`.

- Symptom: a headless acceptance run stops after asking whether to initialize git. Cause: the skill offers `git init` once at document start and the structured-question tool cannot be answered without a user. Response: put the answer in the prompt ("No need to initialize git here"), as `RUN.md` does; the skill then proceeds.

- Symptom: after an acceptance run `git status` shows `tests/ads-introduction/design.md` modified and a new `draft.md`. Cause: the skill correctly updated the fixture record's Status (`draft drafted`) and wrote the draft in the folder it ran in. Response: copy the draft to `results/`, then `git checkout -- design.md` and remove `draft.md`, so the fixture starts from the same state next time.

- Mechanism: `tests/ads-introduction/check.sh` finds the claim-3 sentence and the gap between claims 10 and 11 through the reader's mapping file, not by text matching, because the draft carries no claim markers (the record forbids provenance tags and the draft is the document's text). The mapping is the judged part made mechanical: a wrong mapping makes the check wrong, so compare the printed numbered sentences with the mapping before trusting the result. A sentence rendering two claims is mapped `n a,b`.

- Mechanism: the sentence splitter in `check.sh` drops heading and blank lines, joins the rest with spaces, and splits after `.`, `?` or `!` followed by whitespace or end of text. An abbreviation with a trailing period inside a sentence ("e.g. ") produces an extra sentence; the mapping then needs an extra line, mapped to the same claim as its neighbour.

- How to confirm the independent check ran in a headless run: the reply text shows the check's result but not the tool call. The session log at `~/.claude/projects/-<folder path with slashes as dashes>/<session>.jsonl` contains one `"type":"tool_use"` entry with `"name":"Agent"` per dispatch; `grep -o '"type":"tool_use","id":"[^"]*","name":"Agent"' <log> | wc -l` counts them.

- `claude plugin validate claude` passes but notes README.md and LICENSE missing for directory submission to the public marketplace. README exists at the repository root, not inside `claude/`; a LICENSE has not been chosen. Neither affects a local or GitHub install.

- Three relations in the fixture record (C4 → C5, C6 → C7, C11 → C12) have no connective in the author's Korean lines; the fixture records a reading and lists it as a pending proposal in Status. The first run drafted them without a connective where the reading was uncertain, which the record's rule allows (a relation without a stated condition is rendered without supplying one). Until the author confirms, a run that renders them differently is not a failure.
