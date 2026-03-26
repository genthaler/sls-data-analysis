BEGIN;

CREATE TABLE IF NOT EXISTS core.location (
  location_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  location_role text NOT NULL CHECK (location_role IN ('beach', 'club', 'service_site', 'asset_base', 'unknown')),
  name text,
  latitude double precision,
  longitude double precision,
  geom_wkt text,
  sa2_code text,
  geocode_status text NOT NULL CHECK (geocode_status IN ('observed', 'derived', 'unavailable')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.normalized_beach (
  normalized_beach_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  canonical_name text NOT NULL,
  state_jurisdiction_id uuid REFERENCES core.jurisdiction(jurisdiction_id),
  location_id uuid REFERENCES core.location(location_id),
  source_confidence numeric(5,4),
  normalization_status text NOT NULL CHECK (normalization_status IN ('matched', 'merged', 'ambiguous', 'unresolved')),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (canonical_name, state_jurisdiction_id)
);

CREATE TABLE IF NOT EXISTS core.service (
  service_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  service_name text NOT NULL,
  service_type text NOT NULL CHECK (service_type IN ('club_patrol', 'branch_rescue', 'als', 'council_lifeguard', 'other_professional', 'unknown')),
  service_model text NOT NULL CHECK (service_model IN ('volunteer', 'professional', 'mixed', 'unknown')),
  normalized_beach_id uuid REFERENCES core.normalized_beach(normalized_beach_id),
  club_id uuid REFERENCES core.club(club_id),
  branch_id uuid REFERENCES core.branch(branch_id),
  location_id uuid REFERENCES core.location(location_id),
  operational_status text NOT NULL CHECK (operational_status IN ('active', 'inactive', 'seasonal', 'unknown')),
  observation_status text NOT NULL CHECK (observation_status IN ('observed', 'inferred', 'unavailable')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_service_lookup
  ON core.service (service_type, club_id, branch_id);

CREATE TABLE IF NOT EXISTS core.service_schedule (
  service_schedule_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  service_id uuid NOT NULL REFERENCES core.service(service_id),
  source_record_id uuid NOT NULL REFERENCES raw.beachsafe_raw_record(raw_record_id),
  schedule_text_raw text NOT NULL,
  season_label text,
  day_pattern text,
  start_date date,
  end_date date,
  start_time time,
  end_time time,
  extraction_status text NOT NULL CHECK (extraction_status IN ('structured', 'partial', 'raw_only')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.entity_match_candidate (
  match_candidate_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  reference_entity_type text NOT NULL CHECK (reference_entity_type IN ('branch', 'club')),
  reference_entity_id uuid NOT NULL,
  candidate_entity_type text NOT NULL CHECK (candidate_entity_type IN ('normalized_beach', 'service', 'branch', 'club')),
  candidate_entity_id uuid NOT NULL,
  match_method text NOT NULL CHECK (match_method IN ('exact_name', 'normalized_name', 'location_proximity', 'manual_review')),
  match_score numeric(5,4) NOT NULL,
  decision_status text NOT NULL CHECK (decision_status IN ('accepted', 'rejected', 'pending')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.entity_provenance (
  entity_provenance_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type text NOT NULL CHECK (entity_type IN ('jurisdiction', 'branch', 'club', 'location', 'normalized_beach', 'service', 'service_schedule', 'asset', 'person', 'person_qualification', 'asset_assignment')),
  entity_id uuid NOT NULL,
  source_system text NOT NULL CHECK (source_system IN ('directory', 'beachsafe', 'rescue_services', 'manual')),
  source_record_id uuid NOT NULL,
  derivation_step text NOT NULL CHECK (derivation_step IN ('ingest', 'normalize', 'match', 'manual_resolution')),
  method_id text NOT NULL,
  assumption_set_id uuid,
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMIT;
