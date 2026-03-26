# sls-data-analysis

Context-aware analysis system planning for surf lifesaving clubs, branches, and related services across Australia.

## Status

This repository is currently documentation-first. It defines the project scope, analytical intent, open decisions, and repo-specific working conventions before implementation work begins.

## Project Goal

The project aims to support fair, context-aware comparison across surf lifesaving organisations rather than raw ranking by default. The current requirements focus on:

- club, branch, state, NSW Metro/Country, and national analysis
- patrol and service inventory
- catchment, travel, visitation, and incident analysis
- cross-service reporting for branch Rescue Services assets and personnel
- explicit handling of incomplete data, assumptions, and comparison limits

## Repository Map

- [`docs/requirements.md`](docs/requirements.md): living requirements document and methodology framing
- [`docs/decision-queue.md`](docs/decision-queue.md): unresolved decisions that affect scope, modelling, and implementation order
- [`AGENTS.md`](AGENTS.md): repository-specific instructions for AI agents

## How To Read This Repo

If you are new to the project:

1. Start with [`docs/requirements.md`](docs/requirements.md) to understand the intended system and current assumptions.
2. Read [`docs/decision-queue.md`](docs/decision-queue.md) to see which unresolved questions still shape the design.
3. If you are an AI agent making repo changes, then read [`AGENTS.md`](AGENTS.md).

## Current Scope Boundaries

The current requirements explicitly exclude some areas from the initial implementation, including:

- direct real-time SurfGuard integration
- automated operational rostering decisions
- prescriptive member redistribution unless explicitly introduced later

## Implementation Note

There is no application code in the repository yet. The current priority is to keep the requirements, decision log, and repo conventions coherent enough to support later ingestion, modelling, and reporting work.

## Phase 1 Design Scaffold

The repository now also includes the initial Phase 1 design scaffold for:

- reference hierarchy baseline
- Beachsafe crawl archival
- normalization and reconciliation
- reporting-layer schema planning

## Extended Repository Map

- [`docs/phase-1-system-design.md`](docs/phase-1-system-design.md): Phase 1 entity, flow, and storage design
- [`docs/methodology-register.md`](docs/methodology-register.md): method traceability register, including the Phase 1 normalization method
- [`docs/implementation-slices.md`](docs/implementation-slices.md): first implementation slices and delivery order
- [`sql/phase1/README.md`](sql/phase1/README.md): schema file order and conventions
- [`data/README.md`](data/README.md): expected local input and output layout

## Database Assumption

The initial schema files target PostgreSQL because the Phase 1 design uses explicit schemas (`raw`, `core`, `report`) and JSON payload retention.

This is a working assumption, not a final platform decision. If the project later standardizes on another database, the logical model should remain portable even if the DDL changes.

## Phase 1 Schema Files

- `sql/phase1/001_foundation.sql`
- `sql/phase1/010_raw.sql`
- `sql/phase1/020_core_reference.sql`
- `sql/phase1/030_core_beachsafe.sql`
- `sql/phase1/040_core_rescue_services.sql`
- `sql/phase1/050_reporting.sql`

## Immediate Next Build Step

Implement Slice 1 and Slice 2 against this schema:

1. ingest asserted directory files into `raw.reference_directory_record`
2. normalize `core.jurisdiction`, `core.branch`, and `core.club`
3. run Beachsafe crawls into `raw.crawl_run`, `raw.beachsafe_raw_record`, and `raw.beachsafe_discovered_link`
4. keep all downstream normalization deterministic from those landed records
