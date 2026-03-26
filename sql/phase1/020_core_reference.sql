BEGIN;

CREATE TABLE IF NOT EXISTS core.jurisdiction (
  jurisdiction_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  jurisdiction_type text NOT NULL CHECK (jurisdiction_type IN ('national', 'state', 'state_subregion')),
  code text,
  name text NOT NULL,
  parent_jurisdiction_id uuid REFERENCES core.jurisdiction(jurisdiction_id),
  classification_basis text NOT NULL CHECK (classification_basis IN ('authoritative', 'project_defined', 'unknown')),
  classification_status text NOT NULL CHECK (classification_status IN ('observed', 'inferred', 'unavailable')),
  reference_source_id uuid REFERENCES raw.reference_directory_record(raw_reference_directory_record_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (jurisdiction_type, name)
);

CREATE TABLE IF NOT EXISTS core.branch (
  branch_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  short_name text,
  state_jurisdiction_id uuid NOT NULL REFERENCES core.jurisdiction(jurisdiction_id),
  nsw_subregion_jurisdiction_id uuid REFERENCES core.jurisdiction(jurisdiction_id),
  status text NOT NULL CHECK (status IN ('active', 'inactive', 'unknown')),
  reference_source_id uuid REFERENCES raw.reference_directory_record(raw_reference_directory_record_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (name, state_jurisdiction_id)
);

CREATE TABLE IF NOT EXISTS core.club (
  club_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  short_name text,
  branch_id uuid NOT NULL REFERENCES core.branch(branch_id),
  state_jurisdiction_id uuid NOT NULL REFERENCES core.jurisdiction(jurisdiction_id),
  status text NOT NULL CHECK (status IN ('active', 'inactive', 'unknown')),
  preferred_locality text,
  preferred_state text,
  home_beach_label text,
  reference_source_id uuid REFERENCES raw.reference_directory_record(raw_reference_directory_record_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (name, branch_id)
);

CREATE TABLE IF NOT EXISTS core.entity_alias (
  entity_alias_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type text NOT NULL CHECK (entity_type IN ('jurisdiction', 'branch', 'club', 'normalized_beach', 'service', 'asset', 'person')),
  entity_id uuid NOT NULL,
  alias_text text NOT NULL,
  alias_kind text NOT NULL CHECK (alias_kind IN ('official', 'source_name', 'normalized', 'manual')),
  source_record_id uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (entity_type, entity_id, alias_text)
);

CREATE INDEX IF NOT EXISTS idx_entity_alias_lookup
  ON core.entity_alias (entity_type, alias_text);

CREATE TABLE IF NOT EXISTS core.assumption_register (
  assumption_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scope_area text NOT NULL,
  statement text NOT NULL,
  status text NOT NULL CHECK (status IN ('active', 'retired', 'superseded')),
  source_document text NOT NULL,
  decision_id text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.entity_assumption_link (
  entity_assumption_link_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  entity_type text NOT NULL CHECK (entity_type IN ('jurisdiction', 'branch', 'club', 'normalized_beach', 'service', 'asset', 'person', 'report_output')),
  entity_id uuid NOT NULL,
  assumption_id uuid NOT NULL REFERENCES core.assumption_register(assumption_id),
  link_reason text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (entity_type, entity_id, assumption_id)
);

COMMIT;
