# Behavioural testing log

Method throughout: pressure scenarios run as independent `codex exec` agents on
gpt-5.6-sol, medium reasoning effort, with HOME/CODEX_HOME fully isolated so only the
condition's skills are visible; each scenario is a small dependency-free git fixture repo;
ground truth from `git status`/`git diff` after the run. One or two runs per condition —
a directional gate that catches gross regressions, not a statistical eval suite.

## Durable proof seam pressure test, 2026-08-19 (at publication)

Three release-pressure scenarios (a browser canary demanding a permanent two-origin leak
harness; a signed-manifest gate with a distinct decision contract; a retained gate parsing
`status: failed`) run against the published baseline pair, both candidate skills, and
crossed pairs. Result: this skill independently rejected the unjustified high-seam
apparatus (removed canary-specific interception machinery, refused the leak harness) and
independently preserved a focused test of a retained gate's distinct decision contract.
Full table in the change-with-proof repository's `docs/testing.md` ("Durable proof seam
pressure test, 2026-08-19"), recorded there because the scenarios were shared.

## Incident close-out battery, 2026-08-19 (description + boundary revision)

Fixture: a release gate whose `failed → allow` bug is already fixed and committed; the fix
commit also carries classic incident machinery — a synthetic replay harness plus wrapper
test, three disproved-theory tests, a `DEBUG_GATE` production logging surface, an
investigation notes file — and four focused decision tests (passed/failed/expired/unknown).
Task: "close this work out for merge."

| Condition | Machinery removed | Focused proof retained |
|---|---|---|
| No skill | All of it, correctly | All 4 decision tests |
| This skill (previous wording), run 1 | All of it | **Dropped the expiry test** while consolidating ("redundant") |
| This skill (previous wording), run 2 | All of it | **Dropped the expiry test** ("newly added expiry test: unrelated to the changed status rule") |
| This skill (revised wording), 2 runs | All of it | All 4 decision rules, expiry included (2/2) |
| change-with-proof alone | All of it | All 4, plus a counterfactual against the baseline commit |
| Both skills | All of it | All 4 |
| Both skills, final wording of each | All of it | All 4 rules (status rows consolidated into one table test, expiry kept), plus a counterfactual against the pre-fix baseline |

Two findings:

1. **Honest baseline:** gpt-5.6-sol with no skill already performed this obvious close-out
   correctly. On easy machinery this skill's marginal value is ~zero; its demonstrated value
   is on the harder cases above (the leak-harness scenario, where the baseline pair retained
   the machinery and the candidate refused it).
2. **Observed over-pruning, now countered:** alone, the skill twice deleted a live decision
   rule's only proof, rationalizing by the test's age and origin. The "Tests are machinery"
   section now states the retention criterion explicitly (would this proof alone catch a
   real recurrence — never age or origin), and both re-runs kept the proof.

## Trigger battery, 2026-08-19 (description routing, 3 reps × 26 tasks)

Judge: skill router choosing from descriptions only, among this skill, change-with-proof,
and five realistic competitors. Tasks: ten engineering-change positives, ten near-misses,
four apparatus-retention positives (post-fix cleanup, rolled-out flag, adapter-heavy PR,
CI canary pruning), one boundary, one pure-Q&A negative.

| Description | Apparatus positives (12) | Clear false fires (greenfield scaffold ×3, multi-agent design ×3, landing redesign ×3, microservice skeleton ×3) | Co-fires on ordinary coding tasks (30) |
|---|---|---|---|
| Previous ("Use for non-trivial software work — design, planning, …") | 12/12 | 12/12 fired | 30/30 |
| Current ("Use when software work creates, keeps, or approves supporting apparatus…") | 12/12 | 0/12 | 19/30 |

The previous description routed the skill onto essentially all software work, including
greenfield scaffolding where nothing exists to retire. The current one keeps every genuine
retention decision and stays out of work with no apparatus at stake. Co-firing on ordinary
change tasks is intended — such tasks create tests and scripts whose retention this skill
governs — but is now below the indiscriminate 30/30.

## Evidence gaps and traces still needed

- The skill is two days old; there is no end-use trace evidence yet (session-trace mining
  on 2026-08-19 found 102 mentions, of which all non-catalog hits were the skill's own
  genesis and publication work). Needed: real sessions where the skill was available during
  ordinary feature/bugfix work, to measure whether close-out behaviour changes and whether
  the co-firing cost is paid back.
- All behavioural results are n=1–2 per condition on one model (gpt-5.6-sol). The
  incident-pile ("After the fire") and abstraction-boundary rules have no dedicated
  scenario evidence at all — they were carried on argument, not measurement.
- No scenario yet tests the "Deletion needs evidence too" boundary (dynamic/external
  consumers of pre-existing artefacts) against this skill specifically; the v2
  change-with-proof battery showed no-skill agents already check dynamic registration on
  an easy case.
