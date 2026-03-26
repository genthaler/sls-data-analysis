# Phase 1 SQL

These files implement the logical storage shape defined in [`docs/phase-1-system-design.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/phase-1-system-design.md).

## Order
1. `001_foundation.sql`
2. `010_raw.sql`
3. `020_core_reference.sql`
4. `030_core_beachsafe.sql`
5. `040_core_rescue_services.sql`
6. `050_reporting.sql`

## Scope
- Slice 1 is primarily covered by `010_raw.sql` and `020_core_reference.sql`.
- Slice 2 is primarily covered by `010_raw.sql`.
- Later Phase 1 slices are scaffolded now so IDs and table boundaries stay stable.

## Conventions
- `raw` tables are append-only landing tables.
- `core` tables hold canonical normalized entities.
- `report` tables hold run-scoped derived outputs.
- status fields are explicit; missing values should not be interpreted as zero or false.
