# 0003 Run-time rules live in a user file outside the plugin

Context: a correction that generalizes ("a necessity, not an alternative") must hold in every later document. The author's own writing notes live in an Obsidian vault reachable only through a personal MCP server, and the plugin is installed as a versioned snapshot.

Decision: the plugin ships `references/writing-rules.md`, seeded from the author's notes and the three recorded failures; rules accepted at run time are appended to `~/.claude/www/writing-rules.md`, which is read alongside and wins on conflict.

Alternatives: reading the vault at run time (the skill then depends on a server that exists on one machine); writing accepted rules into the plugin's own files (lost on the next update, or inert in the repository until reinstall); per-document rules only (the correction is repeated in the next document).

Consequences: promoting a run-time rule into the shipped file is a deliberate repository edit, not something the skill does; the user file is a plain Markdown file the author may edit or delete.

Superseded by 0011: rules live in the plugin's `references/writing-rules.md` and `references/types/<type>.md`, changed only through the repository; an accepted rule is recorded in the document's part 4 and shown as the line to add there.
