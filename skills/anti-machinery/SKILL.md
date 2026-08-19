---
name: anti-machinery
description: Use for non-trivial software work — design, planning, investigation, implementation, debugging, refactoring, migration, testing, review, release, or cleanup — whenever the work may create, retain, or approve supporting apparatus such as tests, scripts, harnesses, reports, flags, adapters, caches, compatibility paths, abstractions, debug surfaces, orchestration, or process documents. Governs what may exist permanently after the task closes. Use alongside change-with-proof when existing behaviour is at stake.
---

# Anti-Machinery

Everything built in service of a task — code structure, tests, scripts, flags, reports, process — is machinery with a carrying cost. Machinery earns permanence only through a real continuing need, held at the smallest boundary that contains it. That it helped once is never, by itself, a reason for it to exist tomorrow.

## Two lives

While solving, build whatever the problem demands — probes, one-off scripts, wide experiments, throwaway harnesses. Spend freely; keep it off the supported path and treat it as scheduled for deletion.

When the task closes, the burden reverses: whatever remains must name its continuing need — the consumer that will invoke it, the recurrence it guards, or the transition it carries for a consumer that still exists, together with the observable condition that ends it. Sunk effort, "might be useful", reviewer comfort, and generalised safety name no need. When the need is real but smaller than the artefact, shrink the artefact to the need.

The same rule governs building: structure justified by a predicted future consumer fails it in advance. Let the second concrete case reveal the boundary rather than guessing it.

## Tests are machinery

Discovery legitimately produces many tests; durable proof needs few. Keep one clear proof per distinct risk that can recur — a contract, a boundary, a fixed bug — at the cheapest seam where the proof would actually fail if the risk returned. A test that re-proves the same rule at an adjacent layer, encodes a disproved theory, or restates the implementation adds maintenance and noise but no failure it alone would catch; it leaves with the investigation that produced it.

## Scale from the mechanism

When proof needs scale, take the scale from the failure mechanism: the boundary or cardinality where behaviour changes, the asymptotic regime, the real workload distribution, the concurrency pattern, or a stated latency or resource limit. Run the smallest experiment that could falsify the claim; a big number with no threshold behind it demonstrates effort, not the property. A one-time demonstration at scale is temporary proof — a retained scale test must enforce a named threshold something can drift across.

## Deletion needs evidence too

What this task created or directly superseded — and nothing still uses — is yours to remove; do so before completion. What predates the task may have dynamic, external, or operational consumers that leave no trace in the repository: absence of a known consumer is not absence of a consumer. Outside explicit cleanup scope, flag such candidates rather than deleting them.

## With change-with-proof

`change-with-proof` decides what must change and what evidence proves it. This skill decides what may still exist afterwards. Close a task by proving the change, then subtracting the apparatus that proved it.
