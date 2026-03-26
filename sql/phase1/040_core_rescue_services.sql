BEGIN;

CREATE TABLE IF NOT EXISTS core.asset (
  asset_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  asset_type text NOT NULL CHECK (asset_type IN ('rwc', 'uav', 'do_vehicle', 'other')),
  asset_name text NOT NULL,
  branch_id uuid REFERENCES core.branch(branch_id),
  home_club_id uuid REFERENCES core.club(club_id),
  base_location_id uuid REFERENCES core.location(location_id),
  operational_status text NOT NULL CHECK (operational_status IN ('active', 'inactive', 'seasonal', 'unknown')),
  observation_status text NOT NULL CHECK (observation_status IN ('observed', 'inferred', 'unavailable')),
  attribution_status text NOT NULL CHECK (attribution_status IN ('known', 'partial', 'unknown')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.person (
  person_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  display_name text NOT NULL,
  person_type text NOT NULL CHECK (person_type IN ('member', 'staff', 'unknown')),
  home_club_id uuid REFERENCES core.club(club_id),
  branch_id uuid REFERENCES core.branch(branch_id),
  observation_status text NOT NULL CHECK (observation_status IN ('observed', 'inferred', 'unavailable')),
  attribution_status text NOT NULL CHECK (attribution_status IN ('known', 'partial', 'unknown')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.person_qualification (
  person_qualification_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  person_id uuid NOT NULL REFERENCES core.person(person_id),
  qualification_type text NOT NULL CHECK (qualification_type IN ('rwc_operator', 'uav_operator', 'duty_officer', 'other')),
  qualification_status text NOT NULL CHECK (qualification_status IN ('current', 'expired', 'unknown')),
  valid_from date,
  valid_to date,
  source_record_id uuid REFERENCES raw.rescue_services_record(raw_rescue_services_record_id),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS core.asset_assignment (
  asset_assignment_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  asset_id uuid NOT NULL REFERENCES core.asset(asset_id),
  person_id uuid NOT NULL REFERENCES core.person(person_id),
  assignment_role text NOT NULL,
  start_date date,
  end_date date,
  source_record_id uuid REFERENCES raw.rescue_services_record(raw_rescue_services_record_id),
  created_at timestamptz NOT NULL DEFAULT now()
);

COMMIT;
