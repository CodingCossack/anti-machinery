# Anti-Machinery

[![Validate](https://github.com/CodingCossack/anti-machinery/actions/workflows/validate.yml/badge.svg)](https://github.com/CodingCossack/anti-machinery/actions/workflows/validate.yml)
[![Agent Skill](https://img.shields.io/badge/Agent%20Skill-compatible-111827)](https://agentskills.io/)
[![MIT License](https://img.shields.io/badge/license-MIT-2563eb)](LICENSE)

An agent skill for one recurring failure of agent-driven development: the apparatus built
*while* solving a task — extra tests, debug flags, replay harnesses, one-off scripts,
compatibility shims, speculative abstractions, process documents — quietly becomes permanent
codebase the moment the task closes, and someone maintains it forever.

The rule the skill enforces is a reversal of burden. While solving, build whatever the
problem demands, freely. When the task closes, everything that remains must name its
continuing need — the consumer that will invoke it, the recurring risk it alone would catch,
or the live transition it carries — and the condition that ends it. "It helped once",
"might be useful", and "someone may depend on it" name no need.

Concretely, after a debugging incident:

| Artefact | Verdict |
|---|---|
| One focused test that would fail if the fixed bug returned | **Keep** — it alone catches a recurrence |
| A test for every rule the changed code enforces, merged into one table | **Keep** — each rule is its own risk |
| Three tests encoding the disproved first theory of the bug | Delete — they guard nothing |
| The synthetic-replay harness that reproduced the incident | Delete — its consumer was the investigation |
| A `DEBUG_*` flag wired into production code | Delete — incident-only surface |
| The investigation notes file | Delete — the commit message carries the story |
| A feature flag whose rollout finished | Delete, or wire an expiry that actually fires |

The skill also covers the harder boundaries: release gates and canaries must guard product
risk, not their own mechanism (a fix for the fixer's fix means the proof sits at the wrong
seam); incident-shipped machinery gets re-justified in calm conditions; scale tests take
their scale from the failure mechanism, not an impressive number; and deletion of artefacts
that predate the task needs consumer evidence, not just a clean grep.

## Install

Install globally with the open [`skills`](https://github.com/vercel-labs/skills) CLI:

```sh
npx skills add CodingCossack/anti-machinery -g -y
```

Install for selected agents:

```sh
npx skills add CodingCossack/anti-machinery -g -y \
  -a codex -a claude-code -a gemini-cli -a opencode
```

### Codex native installer

```text
$skill-installer install https://github.com/CodingCossack/anti-machinery/tree/main/skills/anti-machinery
```

The skill follows the open Agent Skills format and has no harness-specific dependency.

## With Change with Proof

[`change-with-proof`](https://github.com/CodingCossack/change-with-proof) determines what must
change and what evidence proves it. `anti-machinery` determines what may remain afterwards.
They are independent skills and can be installed or invoked separately.

```text
Use $anti-machinery with $change-with-proof to implement this change, prove it, and remove
temporary or redundant supporting apparatus before completion.
```

## Testing

Behavioural changes are gated by pressure scenarios run against real coding agents on
fixture repositories, with no-skill and paired-skill controls; results are recorded in
[docs/testing.md](docs/testing.md). Run `./scripts/validate.sh` for structural checks.

## Structure

```text
skills/anti-machinery/
├── SKILL.md
└── agents/
    └── openai.yaml
```

## Contributing

A change should name the continuing need it serves or the recurring failure it prevents.
Run `./scripts/validate.sh` before opening a pull request.

## Licence

[MIT](LICENSE)
