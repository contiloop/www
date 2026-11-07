# 0001 Ship as a plugin, not a symlinked personal skill

Context: the skill had to be installable on another machine with no manual state, and the author wanted the command `/write`. A personal skill symlinked into `~/.claude/skills/write` gives exactly `/write`; a plugin gives `/www:write` but can be installed by anyone from the repository.

Decision: a Claude Code plugin named `www`, repository laid out with a marketplace manifest at the root and the plugin under `claude/`, installed with `claude plugin marketplace add` + `claude plugin install www@www`.

Alternatives: the symlinked personal skill (shorter command, not shareable, reinstall needs a script); both layouts at once (two install paths to keep in step).

Consequences: the command carries the plugin prefix; the installed copy is a snapshot, so edits need a marketplace update and a plugin update to take effect, and nothing the skill learns at run time may be written into its own files.
