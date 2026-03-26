# Decision Queue

## Purpose
This file tracks unresolved decisions that materially affect scope, data modelling, implementation order, and comparison validity.

Use it to:
- prioritise elicitation
- record candidate options
- capture current recommendation
- log final decisions once made

## How To Use
- Move decisions from `Open` to `Decided` once settled.
- Update [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) when a decision is made.
- Prefer resolving higher-priority items first because they unlock downstream design choices.

## Open

### D001 Primary Growth Target
- Priority: High
- Status: Open
- Why it matters: Determines what the model is optimising or benchmarking against and affects required data, outputs, and fairness logic.
- Candidate options:
  - all members
  - active members
  - qualified members
  - patrol capability
  - patrol hours
- Current recommendation: Choose one primary target for phase 1 and allow secondary targets later.
- Downstream impact:
  - opportunity model
  - benchmarking outputs
  - required SurfGuard fields
  - interpretation of success

### D002 Primary Geographic Unit
- Priority: High
- Status: Open
- Why it matters: Affects ABS integration, privacy, interpretability, travel modelling, and map outputs.
- Candidate options:
  - SA1
  - SA2
  - suburb
  - postcode
  - LGA
- Current recommendation: SA2 is the strongest current default for strategic modelling unless a better operational need emerges.
- Downstream impact:
  - demographic joins
  - catchment logic
  - map overlays
  - reporting granularity

### D003 First Implementation Slice
- Priority: High
- Status: Open
- Why it matters: Determines the first useful end-to-end delivery and constrains data engineering design.
- Candidate options:
  - Beachsafe crawl and normalization only
  - national directories plus coverage reconciliation
  - patrol/service inventory
  - ABS demographic integration
  - basic map overlay prototype
- Current recommendation: Start with national directories plus Beachsafe crawl/normalization and coverage reconciliation.
- Downstream impact:
  - schema design
  - ingestion order
  - earliest demonstrable output

### D004 NSW Metro / Country Definition
- Priority: Medium
- Status: Open
- Why it matters: Needed for a consistent NSW comparison hierarchy.
- Candidate options:
  - internal surf lifesaving organisational definition
  - ABS remoteness or geography mapping
  - custom operational mapping
- Current recommendation: Prefer an authoritative organisational definition if one exists.
- Downstream impact:
  - regional reporting
  - directory structure
  - comparison grouping

### D005 Travel Metric
- Priority: Medium
- Status: Open
- Why it matters: Affects accessibility, overlap, and current-travel analysis.
- Candidate options:
  - road travel time
  - straight-line distance
  - both
- Current recommendation: Use both where feasible, but prefer road travel time for behavioural interpretation.
- Downstream impact:
  - catchment model
  - overlap model
  - member-travel analysis

### D006 Visitation Data Source
- Priority: Medium
- Status: Open
- Why it matters: Needed for service-burden and demand modelling.
- Candidate options:
  - one national source
  - multiple state or local sources normalized centrally
  - proxy estimation if direct visitation data is unavailable
- Current recommendation: Prefer observed data first; use proxies only with explicit caveats.
- Downstream impact:
  - demand layer
  - temporal modelling
  - fair comparison of service burden

### D007 Incident Data Scope
- Priority: Medium
- Status: Open
- Why it matters: Determines how risk/outcome is represented and compared.
- Candidate options:
  - rescues and fatalities only
  - broader incident classes if available
- Current recommendation: Start with rescues and fatalities, then expand only if data quality supports it.
- Downstream impact:
  - map overlays
  - burden/risk model
  - expected-vs-actual framing

### D008 Competing-Commitment Method
- Priority: Medium
- Status: Open
- Why it matters: Can strongly affect fairness if done inconsistently.
- Candidate options:
  - fixed national category set
  - locally curated major alternatives
  - broad inventory from common data sources
- Current recommendation: Use a fixed national category set with a repeatable extraction method for phase 1.
- Downstream impact:
  - fairness of comparison
  - data effort
  - interpretation of local opportunity

### D009 Historical Recruitment Effort Availability
- Priority: Medium
- Status: Open
- Why it matters: Needed to distinguish structural context from variable effort more directly.
- Candidate options:
  - effort data exists and can be integrated
  - effort data does not exist and must remain latent/unobserved
  - partial proxies exist
- Current recommendation: Assume effort is unobserved unless clear usable data is found.
- Downstream impact:
  - growth model
  - causal interpretation
  - fairness of performance conclusions

### D010 Club Capability Data Availability
- Priority: Medium
- Status: Open
- Why it matters: Determines how credibly capability can be benchmarked beyond raw membership counts.
- Candidate options:
  - full qualification data available
  - partial qualification data available
  - no reliable qualification data
- Current recommendation: Treat capability metrics as conditional on data quality and completeness.
- Downstream impact:
  - capability comparisons
  - patrol-gap modelling
  - skill-mix reporting

### D011 Rescue Services Data Source And Attribution
- Priority: High
- Status: Open
- Why it matters: Needed to report actual service provision by club members across both club patrols and branch Rescue Services.
- Candidate options:
  - authoritative branch asset/personnel register with club attribution
  - multiple branch/state sources normalized centrally
  - partial manual seed dataset with later enrichment
- Current recommendation: Identify the most authoritative asset/personnel source first and treat home-club attribution as a separate completeness dimension.
- Downstream impact:
  - cross-service contribution reporting
  - fair comparison of club service provision
  - asset and operator inventory design
  - completeness/confidence reporting

## Decided
- None yet.

## Decision Log
- 2026-03-26: Created initial decision queue from open questions in the requirements document.
