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
| M001 | Coverage and entity normalization | Rule-based normalization | Project-specific normalization with provenance mapping | Planned | Club/service inventory, completeness reporting | [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) | Not a canonical statistical method; document rules explicitly |
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

## Review Notes
- No methods have been marked `Active` yet.

## Change Log
- 2026-03-27: Restored methodology register to the repository.
