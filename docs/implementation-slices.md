# Implementation Slices

## Purpose
Translate the Phase 1 system design into the first concrete delivery steps for the repository.

## Slice 1: Reference Hierarchy Baseline

### Inputs
- asserted national/state/branch/club directory files

### Tables
- `raw.reference_directory_record`
- `core.jurisdiction`
- `core.branch`
- `core.club`
- `core.entity_alias`
- `core.assumption_register`
- `core.entity_assumption_link`

### Deliverables
- normalized reference hierarchy
- alias coverage for official and source names
- explicit assumption handling for unresolved regional classifications

### Loader Contract
The first loader should:
1. land each source row in `raw.reference_directory_record`
2. materialize canonical `jurisdiction`, `branch`, and `club` rows
3. create aliases from official and short names
4. record unresolved assumptions instead of forcing silent defaults

## Slice 2: Beachsafe Crawl Archive

### Inputs
- Beachsafe seed URLs or source IDs

### Tables
- `raw.crawl_run`
- `raw.beachsafe_raw_record`
- `raw.beachsafe_discovered_link`

### Deliverables
- deterministic crawl runs
- immutable payload archive
- graph of discovered neighbouring links and service links

### Crawler Contract
The first crawler should:
1. create one `raw.crawl_run` per execution
2. fetch each in-scope payload once per run
3. persist the response body unchanged in `raw.beachsafe_raw_record`
4. parse and persist discovered links in `raw.beachsafe_discovered_link`
5. retain fetch failures and out-of-scope decisions as explicit statuses

## Immediate Follow-On
Once Slice 1 and Slice 2 are working, implement:
- Slice 3 normalization into `core.location`, `core.normalized_beach`, `core.service`, `core.service_schedule`, `core.entity_provenance`
- Slice 4 reconciliation into `core.entity_match_candidate` and `report.coverage_reconciliation_result`
