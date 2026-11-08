# Operations

## Prerequisites

- Claude Code CLI (`claude`, tested with 2.1.x) and/or Codex CLI (`codex`, tested with 0.162.x). For the skill's independent check, Codex needs its multi-agent feature on (`multi_agent = true` under `[features]` in `~/.codex/config.toml`); without it the skill reports that it could not dispatch the check and shows the draft after the self-check only. Writing an accepted rule to `~/.claude/www/writing-rules.md` or a case to `~/.claude/www/cases/` from Codex needs a sandbox that allows writes outside the document folder (`sandbox_mode = "danger-full-access"`, or an approval when asked); a refused write is reported, the rule stays in the document's `design.md`, and the case text stays in the reply.
- `python3` on the path (macOS ships it with the command-line tools); `scripts/check.sh` and `tests/ads-introduction/check.sh` parse JSON and split sentences with it.
- git.

## Install

The repository is `https://github.com/contiloop/www` (public). To install from it:

Claude Code:

```bash
claude plugin marketplace add contiloop/www
```

```bash
claude plugin install www@www
```

Codex:

```bash
codex plugin marketplace add contiloop/www
```

```bash
codex plugin add www@www
```

To develop, clone the repository and give the clone's absolute path to the two `marketplace add` commands instead of `contiloop/www`. Each pair registers a marketplace named `www` and installs the plugin into that tool's cache (`~/.claude/plugins/cache/www/www/<version>/`, `~/.codex/plugins/cache/www/www/<version>/`). The command is `/www:write` in Claude Code and `$write` in Codex; Codex loads plugins at session start. Reinstalling on another machine is these commands; nothing else is configured.

## After editing the skill

Edit only `src/skills/write/` and `platform/`. Then raise the version in all three `platform/*/plugin*.json` files (the installers compare versions, not content; an unchanged version keeps the old files), rebuild, check, commit:

```bash
sh scripts/build.sh && sh scripts/check.sh
```

Update the installed copies:

```bash
claude plugin marketplace update www && claude plugin update www@www
```

```bash
codex plugin remove www && codex plugin add www@www
```

For a marketplace added from GitHub, `claude plugin marketplace update www` and `codex plugin marketplace upgrade www` fetch the new commit after it is pushed; for a local-path marketplace, `codex plugin marketplace upgrade` does nothing, so remove and add the plugin. Verify an update with `diff -q src/skills/write/references/elicit.md <cache path>/skills/write/references/elicit.md`.

## Build and structure check

```bash
sh scripts/build.sh
```

Regenerates `claude/` and `codex/plugin/` from `src/` and `platform/`; refuses to run when the three manifest versions differ.

```bash
sh scripts/check.sh
```

Exit 0 when both marketplace manifests name `www`, the three platform manifests share one version, the source skill is well formed and cross-named, `openai.yaml` is present, and both committed packages equal a fresh build. Prints one `ok`/`FAIL` line per check.

## Acceptance test

Follow `tests/ads-introduction/RUN.md`. Before any run move the case store aside, `mv ~/.claude/www/cases ~/.claude/www/cases.aside`, and restore it after, `mv ~/.claude/www/cases.aside ~/.claude/www/cases`; with the store in place the draft would depend on the cases the machine holds. Interactive: open a Claude Code session in `tests/ads-introduction/`, run `/www:write`, ask for the Introduction draft and a Korean explanation. Headless, from the repository root:

```bash
cd tests/ads-introduction && claude -p --dangerously-skip-permissions --output-format text --max-turns 60 "/www:write No need to initialize git here. Draft the Introduction section. After the draft and its checks, give me a Korean explanation of what the draft says." < /dev/null > results/transcript.txt
```

Then copy `draft.md` to `results/draft.md`, extract the explanation to `results/explanation.md`, write `results/mapping.txt` (one line per sentence, `<n> <claim or none>`, `3 3,4` when a sentence renders two claims), and run:

```bash
sh tests/ads-introduction/check.sh tests/ads-introduction/results/draft.md tests/ads-introduction/results/mapping.txt
```

Codex, headless, from `tests/ads-introduction/` (single quotes keep the shell from expanding `$write`):

```bash
codex exec --dangerously-bypass-approvals-and-sandbox '$write No need to initialize git here. Keep the three pending relations as written. Draft the Introduction section. After the draft and its checks, give me a Korean explanation of what the draft says.' < /dev/null > results/transcript-codex.txt 2>&1
```

Save the artifacts with the `-codex` suffix and run the same `check.sh`. Codex's session log under `~/.codex/sessions/<year>/<month>/<day>/` shows the independent check as a `spawn_agent` call.

Record the judged conditions in `results/RESULT.md`. Each run changes the fixture's `design.md` Status and writes `draft.md` into the fixture folder; restore both before committing:

```bash
git checkout -- tests/ads-introduction/design.md && rm -f tests/ads-introduction/draft.md
```

## Using the skill on a document

Open a Claude Code or Codex session in the document's folder (or pass the folder path after the command) and run `/www:write` or `$write` followed by the request in plain words. The skill creates `design.md` and `draft.md` there. `~/.claude/www/writing-rules.md` appears the first time a cross-document rule is accepted; deleting it drops those rules, nothing else. When every section is drafted and nothing is open, the skill offers once per session to write the document's case to `~/.claude/www/cases/<date>-<folder name>.md`, showing the whole case first; the author may also ask for it at any time. Cases are read on later documents for how to write; deleting a case file drops that document's lessons, nothing else.

## Uninstall

```bash
claude plugin uninstall www@www && claude plugin marketplace remove www
```

```bash
codex plugin remove www && codex plugin marketplace remove www
```

Document folders, `~/.claude/www/writing-rules.md` and `~/.claude/www/cases/` are untouched by uninstalling.
