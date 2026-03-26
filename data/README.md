# Data Layout

This directory documents the expected file layout for Phase 1 local runs.

## Suggested Structure
- `reference/`
  - asserted national, state, branch, and club directories
- `beachsafe/`
  - optional exported crawl payload snapshots if retained outside the database
- `rescue-services/`
  - asset and personnel seed files from branches or states
- `exports/`
  - generated reconciliation reports, inventory snapshots, and map-ready outputs

The database remains the primary system of record for landed raw payloads and normalized tables. This folder is for operator-managed inputs and generated files.
