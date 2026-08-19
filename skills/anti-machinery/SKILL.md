---
name: anti-machinery
description: Use for non-trivial software work — design, planning, investigation, implementation, debugging, refactoring, migration, testing, review, release, or cleanup — whenever the work may create, retain, or approve supporting apparatus such as tests, scripts, harnesses, reports, flags, adapters, caches, compatibility paths, abstractions, debug surfaces, orchestration, or process documents. Governs what may exist permanently after the task closes. Use alongside change-with-proof when existing behaviour is at stake.
---

# Anti-Machinery

Everything built in service of a task — code structure, tests, scripts, flags, reports, process — is machinery with a carrying cost. Machinery earns permanence only through a real continuing need, held at the smallest boundary that contains it. That it helped once is never, by itself, a reason for it to exist tomorrow.

## Two lives

While solving, build whatever the problem demands — probes, one-off scripts, wide experiments, throwaway harnesses. Spend freely; keep it off the supported path and treat it as scheduled for deletion.

When the task closes, the burden reverses: whatever remains must name its continuing need — the consumer that will invoke it, the recurrence it guards, or the transition it carries for a consumer that still exists, together with the observable condition that ends it. A stated end condition is not an end condition: wire it to something that will actually fire — a check that fails past the deadline, a scheduled removal, an expiry in the code itself. A comment naming a date will outlive the date. Sunk effort, "might be useful", reviewer comfort, and generalised safety name no need. When the need is real but smaller than the artefact, shrink the artefact to the need.

The same rule governs building: structure justified by a predicted future consumer fails it in advance. Let the second concrete case reveal the boundary rather than guessing it.

## Tests are machinery

Discovery legitimately produces many tests; durable proof needs few. Keep one clear proof per distinct risk that can recur — a contract, a boundary, a fixed bug — at the cheapest seam where the proof would actually fail if the risk returned. A test that re-proves the same rule at an adjacent layer, encodes a disproved theory, or restates the implementation adds maintenance and noise but no failure it alone would catch; it leaves with the investigation that produced it.

## Gates guard risks, not themselves

Release gates, canaries, and CI checks carry the same burden as any machinery, plus one of their own: they must name not only the recurrence they guard but the ways they can fail while the product is healthy. A gate that blocks for reasons other than its risk is defective machinery — prefer moving the proof to a cheaper seam over repairing the gate in place. A focused test of a gate's distinct decision logic is ordinary proof, not recursion. When a gate needs apparatus that merely re-proves the same assertion or compensates for its own unreliable mechanism — a canary fix that needs a leak-proof harness, a fix for the fixer's fix — stop building. That recursion is evidence the proof sits at the wrong seam or relies on a mechanism too clever to trust; redesign the proof rather than reinforcing it.

## After the fire

Incident pressure defeats the two-lives split: exploration lands directly on supported paths, and the task "closes" with a deploy, so the reversal of burden never runs. When an incident closes, everything it added to permanent paths gets re-justified as if proposed fresh in calm conditions, and the default answer is deletion. Judge the pile, not only the pieces — supporting machinery must stay proportionate to the product it supports, and each individually defensible addition is no defence of the total.

## Scale from the mechanism

When proof needs scale, take the scale from the failure mechanism: the boundary or cardinality where behaviour changes, the asymptotic regime, the real workload distribution, the concurrency pattern, or a stated latency or resource limit. Run the smallest experiment that could falsify the claim; a big number with no threshold behind it demonstrates effort, not the property. A one-time demonstration at scale is temporary proof — a retained scale test must enforce a named threshold something can drift across.

## Deletion needs evidence too

What this task created or directly superseded — and nothing still uses — is yours to remove; do so before completion. What predates the task may have dynamic, external, or operational consumers that leave no trace in the repository: absence of a known consumer is not absence of a consumer. Outside explicit cleanup scope, flag such candidates rather than deleting them.

## With change-with-proof

`change-with-proof` decides what must change and what evidence proves it. This skill decides what may still exist afterwards. Close a task by proving the change, then subtracting the apparatus that proved it.
