#!/usr/bin/env bash
set -euo pipefail

fail() { printf 'error: %s\n' "$1" >&2; exit 1; }

required=(
  README.md
  LICENSE
  SECURITY.md
  skills/anti-machinery/SKILL.md
  skills/anti-machinery/agents/openai.yaml
  .github/workflows/validate.yml
)

for path in "${required[@]}"; do
  [[ -f "$path" ]] || fail "missing required file: $path"
done

python3 - <<'PY'
from pathlib import Path

path = Path("skills/anti-machinery/SKILL.md")
text = path.read_text(encoding="utf-8")
parts = text.split("---", 2)
if len(parts) != 3 or parts[0].strip():
    raise SystemExit("error: SKILL.md must start with YAML frontmatter")

fields = {}
for line in parts[1].splitlines():
    if ":" in line:
        key, value = line.split(":", 1)
        fields[key.strip()] = value.strip()

if fields.get("name") != path.parent.name:
    raise SystemExit("error: skill name must match its directory")
if not fields.get("description"):
    raise SystemExit("error: skill description is required")
PY

grep -Fq '$anti-machinery' skills/anti-machinery/agents/openai.yaml \
  || fail 'openai.yaml must reference $anti-machinery'
grep -Fq 'CodingCossack/anti-machinery' README.md \
  || fail 'README must document the install source repo'

[[ -z "$(find . -type l -print -quit)" ]] || fail 'symlinks are not allowed'

if grep -RInE '/Users/|/home/[^ /]+/' . --exclude=validate.sh --exclude-dir=.git >/dev/null 2>&1; then
  grep -RInE '/Users/|/home/[^ /]+/' . --exclude=validate.sh --exclude-dir=.git >&2 || true
  fail 'private absolute paths found'
fi

printf 'anti-machinery validation passed.\n'
