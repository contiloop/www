# Operations

## Prerequisites

- Claude Code CLI (`claude`) 2.1 or later on the machine.
- `python3` on the path (macOS ships it with the command-line tools); `scripts/check.sh` and `tests/ads-introduction/check.sh` parse JSON and split sentences with it.
- git.

## Install from a clone

```bash
git clone <repository url> www
```

```bash
claude plugin marketplace add /absolute/path/to/www
```

```bash
claude plugin install www@www
```

The second command registers the folder as a marketplace named `www`; the third installs the plugin into `~/.claude/plugins/cache/www/www/<version>/` at user scope. The command `/www:write` is available in every Claude Code session afterwards. Reinstalling on another machine is these three commands; nothing else is configured.

## After editing the skill

The installed copy is a snapshot. Edits in the repository take effect only after:

```bash
claude plugin marketplace update www
```

```bash
claude plugin update www@www
```

Run `sh scripts/check.sh` before updating; a failing structure check means the installed skill would name a missing reference or carry no frontmatter.

## Structure check

```bash
sh scripts/check.sh
```

Exit 0 when the manifests name `www`, every reference has a heading and body, `SKILL.md` has `name: write`, and `SKILL.md` and `references/` name each other completely. Prints one `ok`/`FAIL` line per check.

## Acceptance test

Follow `tests/ads-introduction/RUN.md`. Interactive: open a Claude Code session in `tests/ads-introduction/`, run `/www:write`, ask for the Introduction draft and a Korean explanation. Headless, from the repository root:

```bash
cd tests/ads-introduction && claude -p --dangerously-skip-permissions --output-format text --max-turns 60 "/www:write No need to initialize git here. Draft the Introduction section. After the draft and its checks, give me a Korean explanation of what the draft says." < /dev/null > results/transcript.txt
```

Then copy `draft.md` to `results/draft.md`, extract the explanation to `results/explanation.md`, write `results/mapping.txt` (one line per sentence, `<n> <claim or none>`, `3 3,4` when a sentence renders two claims), and run:

```bash
sh tests/ads-introduction/check.sh tests/ads-introduction/results/draft.md tests/ads-introduction/results/mapping.txt
```

Record the judged conditions in `results/RESULT.md`. The run changes the fixture's `design.md` Status and writes `draft.md` into the fixture folder; restore both before committing:

```bash
git checkout -- tests/ads-introduction/design.md && rm -f tests/ads-introduction/draft.md
```

## Using the skill on a document

Open a Claude Code session in the document's folder (or pass the folder path after the command) and run `/www:write` followed by the request in plain words. The skill creates `design.md` and `draft.md` there. `~/.claude/www/writing-rules.md` appears the first time a cross-document rule is accepted; deleting it drops those rules, nothing else.

## Uninstall

```bash
claude plugin uninstall www@www
```

```bash
claude plugin marketplace remove www
```

Document folders and `~/.claude/www/writing-rules.md` are untouched by uninstalling.
