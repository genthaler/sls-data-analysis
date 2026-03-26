BEGIN;

CREATE TABLE IF NOT EXISTS report.coverage_reconciliation_run (
  reconciliation_run_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  notes text
);

CREATE TABLE IF NOT EXISTS report.coverage_reconciliation_result (
  reconciliation_result_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  reconciliation_run_id uuid NOT NULL REFERENCES report.coverage_reconciliation_run(reconciliation_run_id),
  reference_entity_type text NOT NULL CHECK (reference_entity_type IN ('branch', 'club')),
  reference_entity_id uuid NOT NULL,
  coverage_status text NOT NULL CHECK (coverage_status IN ('matched', 'missing_in_crawl', 'crawl_only', 'duplicate', 'ambiguous')),
  matched_entity_type text CHECK (matched_entity_type IN ('normalized_beach', 'service', 'branch', 'club')),
  matched_entity_id uuid,
  reason_code text NOT NULL,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS report.completeness_summary (
  completeness_summary_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  reconciliation_run_id uuid REFERENCES report.coverage_reconciliation_run(reconciliation_run_id),
  subject_type text NOT NULL CHECK (subject_type IN ('branch', 'club', 'service', 'asset', 'person')),
  subject_scope text NOT NULL,
  metric_name text NOT NULL,
  metric_value numeric NOT NULL,
  metric_denominator numeric,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS report.service_inventory_snapshot (
  service_inventory_snapshot_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  snapshot_at timestamptz NOT NULL DEFAULT now(),
  service_id uuid NOT NULL REFERENCES core.service(service_id),
  branch_id uuid REFERENCES core.branch(branch_id),
  club_id uuid REFERENCES core.club(club_id),
  normalized_beach_id uuid REFERENCES core.normalized_beach(normalized_beach_id),
  schedule_coverage_status text NOT NULL CHECK (schedule_coverage_status IN ('observed', 'partial', 'missing')),
  provenance_count integer NOT NULL,
  observation_status text NOT NULL CHECK (observation_status IN ('observed', 'inferred', 'unavailable'))
);

CREATE TABLE IF NOT EXISTS report.asset_personnel_snapshot (
  asset_personnel_snapshot_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  snapshot_at timestamptz NOT NULL DEFAULT now(),
  subject_type text NOT NULL CHECK (subject_type IN ('asset', 'person')),
  subject_id uuid NOT NULL,
  branch_id uuid REFERENCES core.branch(branch_id),
  home_club_id uuid REFERENCES core.club(club_id),
  attribution_status text NOT NULL CHECK (attribution_status IN ('known', 'partial', 'unknown')),
  completeness_note text
);

CREATE TABLE IF NOT EXISTS report.map_feature_export (
  map_feature_export_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  export_run_label text NOT NULL,
  entity_type text NOT NULL CHECK (entity_type IN ('branch', 'club', 'normalized_beach', 'service', 'asset')),
  entity_id uuid NOT NULL,
  location_id uuid REFERENCES core.location(location_id),
  geometry_wkt text,
  geometry_source text NOT NULL,
  confidence_label text NOT NULL CHECK (confidence_label IN ('high', 'medium', 'low', 'unknown')),
  observation_status text NOT NULL CHECK (observation_status IN ('observed', 'inferred', 'unavailable')),
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMIT;
