# Findings

- Under a headless run with `--output-format text`, the reply shows the independent check's result but not that a subagent was dispatched; the dispatch is visible only in the session log. Blast radius: the acceptance condition "both checks visible in the transcript" cannot be judged from `results/transcript.txt` alone. Not solved now: the output format is the CLI's; the workaround (count `Agent` tool uses in the session log) is in engineering notes. Possible approach: run the acceptance with `--output-format stream-json` and save that instead.

- Three relations in the fixture record (C4 → C5, C6 → C7, C11 → C12) are the fixture writer's reading of lines whose Korean has no connective; the author has not confirmed them. Blast radius: a run that renders them differently cannot be called a failure until the author settles them. Not solved now: only the author can. Approach: ask in the first live session and update `tests/ads-introduction/design.md`.
