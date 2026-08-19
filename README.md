# Anti-Machinery

[![Validate](https://github.com/CodingCossack/anti-machinery/actions/workflows/validate.yml/badge.svg)](https://github.com/CodingCossack/anti-machinery/actions/workflows/validate.yml)
[![Agent Skill](https://img.shields.io/badge/Agent%20Skill-compatible-111827)](https://agentskills.io/)
[![MIT License](https://img.shields.io/badge/license-MIT-2563eb)](LICENSE)

An agent skill for preventing temporary software-development apparatus from becoming permanent
maintenance debt. It governs tests, scripts, harnesses, flags, adapters, caches, compatibility
paths, abstractions, debug surfaces, orchestration, and process documents.

The rule is simple: build whatever investigation requires, then remove it before completion
unless it serves a real continuing consumer, recurring risk, or live transition. Keep the
smallest artefact that meets that need.

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

## What it governs

- **Two lives:** temporary investigative machinery is cheap; permanent supported machinery
  must name its continuing need.
- **Tests:** retain one proof per distinct recurring risk at the cheapest seam that can catch
  its return. Remove duplicate or theory-specific investigation tests.
- **Scale:** derive load from the failure mechanism or a named threshold, not an impressive
  arbitrary number.
- **Deletion:** remove new or directly superseded unused artefacts. Treat older unknown
  artefacts as candidates until their static, dynamic, and external consumers are checked.
- **Abstraction:** wait for a second concrete consumer to reveal the boundary instead of
  building for a predicted future use.

## With Change with Proof

[`change-with-proof`](https://github.com/CodingCossack/change-with-proof) determines what must
change and what evidence proves it. `anti-machinery` determines what may remain afterwards.
They are independent skills and can be installed or invoked separately.

```text
Use $anti-machinery with $change-with-proof to implement this change, prove it, and remove
temporary or redundant supporting apparatus before completion.
```

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
