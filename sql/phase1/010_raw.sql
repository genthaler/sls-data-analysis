BEGIN;

CREATE TABLE IF NOT EXISTS raw.crawl_run (
  crawl_run_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_system text NOT NULL,
  run_label text,
  started_at timestamptz NOT NULL DEFAULT now(),
  finished_at timestamptz,
  seed_scope jsonb NOT NULL DEFAULT '{}'::jsonb,
  run_status text NOT NULL CHECK (run_status IN ('running', 'completed', 'failed', 'cancelled')),
  notes text
);

CREATE TABLE IF NOT EXISTS raw.reference_directory_record (
  raw_reference_directory_record_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_system text NOT NULL,
  source_file text,
  record_type text NOT NULL CHECK (record_type IN ('jurisdiction', 'branch', 'club', 'other')),
  source_row_identifier text,
  ingested_at timestamptz NOT NULL DEFAULT now(),
  payload_json jsonb NOT NULL,
  payload_hash text NOT NULL,
  UNIQUE (source_system, payload_hash)
);

CREATE TABLE IF NOT EXISTS raw.beachsafe_raw_record (
  raw_record_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  crawl_run_id uuid NOT NULL REFERENCES raw.crawl_run(crawl_run_id),
  source_url text NOT NULL,
  source_entity_type text,
  source_entity_key text,
  fetched_at timestamptz NOT NULL DEFAULT now(),
  http_status integer,
  payload_json jsonb NOT NULL,
  payload_hash text NOT NULL,
  UNIQUE (crawl_run_id, source_url),
  UNIQUE (crawl_run_id, payload_hash)
);

CREATE INDEX IF NOT EXISTS idx_beachsafe_raw_record_source_entity_key
  ON raw.beachsafe_raw_record (source_entity_key);

CREATE TABLE IF NOT EXISTS raw.beachsafe_discovered_link (
  discovered_link_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  crawl_run_id uuid NOT NULL REFERENCES raw.crawl_run(crawl_run_id),
  from_raw_record_id uuid NOT NULL REFERENCES raw.beachsafe_raw_record(raw_record_id),
  link_relation text NOT NULL CHECK (link_relation IN ('neighbour', 'service', 'beach', 'club', 'other')),
  target_source_key text,
  target_url text NOT NULL,
  follow_status text NOT NULL CHECK (follow_status IN ('queued', 'fetched', 'skipped', 'out_of_scope', 'failed')),
  discovered_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (crawl_run_id, from_raw_record_id, target_url)
);

CREATE INDEX IF NOT EXISTS idx_beachsafe_discovered_link_target_source_key
  ON raw.beachsafe_discovered_link (target_source_key);

CREATE TABLE IF NOT EXISTS raw.rescue_services_record (
  raw_rescue_services_record_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_system text NOT NULL,
  source_file text,
  record_type text NOT NULL CHECK (record_type IN ('asset', 'person', 'qualification', 'assignment', 'other')),
  source_row_identifier text,
  ingested_at timestamptz NOT NULL DEFAULT now(),
  payload_json jsonb NOT NULL,
  payload_hash text NOT NULL,
  UNIQUE (source_system, record_type, payload_hash)
);

COMMIT;
