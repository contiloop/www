#!/bin/sh
# Mechanical part of the ADS Introduction test.
# Usage: sh check.sh <draft.md> <mapping.txt>
#
# Sentence numbering (the mapping must use the same rule):
#   - lines that start with '#' (Markdown headings) and blank lines are dropped
#   - the remaining lines are joined with single spaces
#   - the text is split after '.', '?' or '!' when the mark is followed by
#     whitespace or by the end of the text; sentences are numbered from 1
# The numbered sentences are printed first so the numbering can be compared.
#
# Mapping file: one line per sentence, "<sentence number> <claim number or none>".
# Blank lines and lines starting with '#' are ignored.
#
# Checks (each printed as "ok" or "FAIL"; exit 1 when any fails):
#   1. the mapping lists every sentence number exactly once
#   2. no sentence is mapped none
#   3. every claim 1 to 12 is mapped by at least one sentence
#   4. the sentence mapped to claim 3 contains a local-deployment term
#      (local, locally, on-premise, on-premises, on-device; case-insensitive)
#   5. the sentence mapped to claim 3 contains neither "alternative" nor "option"
#   6. no sentence lies between the sentences mapped to claims 10 and 11
set -u

usage() {
  printf 'usage: sh check.sh <draft.md> <mapping.txt>\n' >&2
  exit 2
}

[ $# -eq 2 ] || usage
DRAFT=$1
MAPPING=$2
for f in "$DRAFT" "$MAPPING"; do
  if [ ! -f "$f" ]; then
    printf 'check.sh: file not found: %s\n' "$f" >&2
    usage
  fi
done
if ! command -v python3 >/dev/null 2>&1; then
  printf 'check.sh: python3 not found\n' >&2
  exit 2
fi

python3 -I - "$DRAFT" "$MAPPING" <<'PY'
import re
import sys

draft_path, mapping_path = sys.argv[1], sys.argv[2]

# Split the draft into numbered sentences.
lines = []
with open(draft_path, encoding="utf-8") as fh:
    for raw in fh:
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        lines.append(line)
text = " ".join(lines)
parts = re.split(r"(?<=[.?!])(?:\s+|$)", text)
sentences = [p.strip() for p in parts if p.strip()]

print("Sentences:")
for i, s in enumerate(sentences, 1):
    print(f"  {i} {s}")
print()

# Read the mapping.
mapping = {}
errors = []
with open(mapping_path, encoding="utf-8") as fh:
    for lineno, raw in enumerate(fh, 1):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        fields = line.split()
        if len(fields) != 2 or not fields[0].isdigit():
            errors.append(f"mapping line {lineno} is not '<sentence number> <claim number or none>': {line}")
            continue
        n = int(fields[0])
        claim = fields[1]
        if claim != "none" and not claim.isdigit():
            errors.append(f"mapping line {lineno}: claim must be a number or none: {line}")
            continue
        if n in mapping:
            errors.append(f"mapping line {lineno}: sentence {n} listed twice")
            continue
        mapping[n] = None if claim == "none" else int(claim)

failed = False

def ok(msg):
    print(f"ok    {msg}")

def fail(msg):
    global failed
    failed = True
    print(f"FAIL  {msg}")

# 1. coverage
expected = set(range(1, len(sentences) + 1))
missing = sorted(expected - set(mapping))
extra = sorted(set(mapping) - expected)
for e in errors:
    fail(e)
if missing or extra:
    detail = []
    if missing:
        detail.append("sentences without a mapping line: " + ", ".join(map(str, missing)))
    if extra:
        detail.append("mapping lines for sentences the draft does not have: " + ", ".join(map(str, extra)))
    fail(f"mapping covers {len(mapping)} sentences, draft has {len(sentences)}; " + "; ".join(detail))
elif not errors:
    ok(f"mapping lists every sentence exactly once ({len(sentences)} sentences)")

# 2. no none
none_sentences = sorted(n for n, c in mapping.items() if c is None)
if none_sentences:
    fail("sentences mapped none: " + ", ".join(map(str, none_sentences)))
else:
    ok("no sentence is mapped none")

# 3. every claim mapped
by_claim = {}
for n, c in mapping.items():
    if c is not None:
        by_claim.setdefault(c, []).append(n)
unmapped_claims = [c for c in range(1, 13) if c not in by_claim]
if unmapped_claims:
    fail("claims with no sentence: " + ", ".join(map(str, unmapped_claims)))
else:
    ok("every claim 1 to 12 is mapped by at least one sentence")

# 4 and 5. the claim 3 sentence
local_re = re.compile(r"\b(local|locally|on-premises?|on-device)\b", re.IGNORECASE)
banned_re = re.compile(r"\b(alternatives?|options?)\b", re.IGNORECASE)
c3 = sorted(by_claim.get(3, []))
if not c3:
    fail("claim 3: no sentence to check for the local-deployment term")
    fail("claim 3: no sentence to check for alternative/option")
else:
    c3_text = " ".join(sentences[n - 1] for n in c3 if 1 <= n <= len(sentences))
    m = local_re.search(c3_text)
    if m:
        ok(f"claim 3 sentence contains a local-deployment term ({m.group(0)})")
    else:
        fail("claim 3 sentence has no local-deployment term (local, locally, on-premise, on-device)")
    b = banned_re.findall(c3_text)
    if b:
        fail("claim 3 sentence contains " + ", ".join(sorted(set(w.lower() for w in b))))
    else:
        ok("claim 3 sentence contains neither alternative nor option")

# 6. nothing between claims 10 and 11
c10 = by_claim.get(10, [])
c11 = by_claim.get(11, [])
if not c10 or not c11:
    fail("claims 10 and 11: both must be mapped to check the gap between them")
else:
    lo = min(c10 + c11)
    hi = max(c10 + c11)
    between = sorted(n for n in range(lo + 1, hi) if mapping.get(n) not in (10, 11))
    if between:
        fail("sentences between claims 10 and 11: " + ", ".join(map(str, between)))
    else:
        ok("no sentence lies between claims 10 and 11")

sys.exit(1 if failed else 0)
PY
