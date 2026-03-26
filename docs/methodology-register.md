# Methodology Register

## Purpose
This register tracks the methodological basis for material analytical components in the project.

Use it to:
- record which methodology family is being used
- state the specific variant or simplification adopted
- link outputs to methods
- capture assumptions, limitations, and review notes
- improve future traceability, public reviewability, and handover

This file complements [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md). Update both when a methodology materially affects project scope, outputs, or interpretation.

## Status Labels
- `Candidate`: method identified but not yet adopted
- `Planned`: method chosen for a future implementation phase
- `Active`: method currently implemented or relied upon
- `Superseded`: method no longer preferred for current use

## Register

| ID | Analytical Component | Method Family | Variant / Simplification | Status | Outputs Affected | References | Notes |
|---|---|---|---|---|---|---|---|
| M001 | Coverage and entity normalization | Rule-based normalization | Project-specific normalization with provenance mapping and reconciliation states | Active | Club/service inventory, completeness reporting, Phase 1 reference baseline | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md), [`docs/phase-1-system-design.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/phase-1-system-design.md) | Phase 1 method; rules must remain explicit and reviewable |
| M002 | Catchment accessibility | Floating catchment area methods | 2SFCA-family method, exact variant TBD | Candidate | Catchment view, overlap analysis, opportunity model | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Preferred methodological family for overlapping catchments |
| M003 | Club choice among alternatives | Spatial interaction / choice modelling | Gravity or destination-choice model, TBD | Candidate | Club choice interpretation, overlap weighting | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Only needed if behavioural choice modelling is pursued |
| M004 | Contextual benchmarking | Multilevel / hierarchical modelling | Exact specification TBD | Candidate | Expected-vs-actual comparison, fair benchmarking | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Preferred initial family for fair comparison |
| M005 | Incident and burden modelling | Count regression | Poisson or negative binomial with exposure term, TBD | Candidate | Incident models, burden/risk outputs | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Exposure variable must be explicit |
| M006 | Sparse local estimation | Small area estimation | Exact approach TBD | Candidate | Local estimates where direct data is incomplete | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Use only when direct observation is insufficient |
| M007 | Spatial risk smoothing | Bayesian spatial modelling | BYM/BYM2-style smoothing if required | Candidate | Sparse incident/risk maps | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Only if raw small-area maps are unstable |
| M008 | Frontier benchmarking | Efficiency / frontier modelling | SFA or DEA, TBD | Candidate | Advanced benchmarking outputs | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Late-stage only; interpretability risk |

## Per-Method Template

Copy this block when a method moves beyond a simple register row.

### Method ID
- Status:
- Analytical component:
- Method family:
- Variant / simplification:
- Phase introduced:
- Outputs affected:
- Why chosen:
- Inputs required:
- Assumptions:
- Limitations:
- Alternatives considered:
- Principal references:
- Design document:
- Code location:
- Review notes:

### Method ID
- Status: Active
- Analytical component: Coverage and entity normalization
- Method family: Rule-based normalization
- Variant / simplification: Project-specific canonicalization, aliasing, provenance mapping, and explicit reconciliation states for asserted versus discovered entities
- Phase introduced: Phase 1
- Outputs affected: Reference directory snapshot, Beachsafe normalization outputs, coverage reconciliation report, service inventory
- Why chosen: Phase 1 requires a descriptive and auditable baseline before any statistical modelling. Rule-based normalization is the simplest defensible method for preserving traceability while exposing ambiguity.
- Inputs required: Asserted directories, Beachsafe raw records, discovered-link graph, manual alias/review inputs where needed
- Assumptions: Source records contain enough structure for deterministic extraction; some mappings will remain unresolved and should be reported rather than forced
- Limitations: Sensitive to source naming inconsistencies; does not estimate missing entities statistically; requires review workflow for ambiguous cases
- Alternatives considered: Early probabilistic entity resolution was rejected for Phase 1 because it would reduce interpretability and make completeness reporting harder to defend
- Principal references: [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md), [`docs/phase-1-system-design.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/phase-1-system-design.md)
- Design document: [`docs/phase-1-system-design.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/phase-1-system-design.md)
- Code location: Not yet implemented
- Review notes: Keep normalization rules explicit, preserve raw values, and maintain observed/inferred/unavailable status semantics

## Review Notes
- `M001` is now active for the Phase 1 baseline design. Statistical methods remain unimplemented and should not be implied by Phase 1 outputs.

## Change Log
- 2026-03-26: Created initial methodology register.
- 2026-03-26: Marked `M001` active and linked it to the Phase 1 system design.
