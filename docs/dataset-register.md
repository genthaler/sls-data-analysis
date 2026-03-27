# Dataset Register

## Purpose
This register tracks dataset ownership, permission status, confidentiality, privacy considerations, and usage constraints for all datasets considered or used by the project.

Use it to:
- record who owns or stewards each dataset
- document the basis on which the project is allowed to use the data
- track confidentiality and publication constraints
- identify privacy risk and whether personal information is present or derived
- support reviewability, compliance, and safe project handover

This file complements [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md). Update both when data-governance decisions materially affect project scope, design, or outputs.

## Status Labels
- `Candidate`: dataset identified but not yet approved for use
- `Requested`: permission, access, or clarification has been requested
- `Approved`: dataset approved for project use under documented conditions
- `Restricted`: dataset available only under limited access or limited-use conditions
- `Rejected`: dataset not approved or not suitable for use
- `Retired`: dataset no longer in active use

## Classification Guidance

### Confidentiality
- `Public`: publicly accessible and reusable subject to recorded terms
- `Permissioned`: use requires explicit approval or is governed by specific terms
- `Restricted`: use is limited to specific people, systems, or outputs
- `Commercial-in-confidence`: use is subject to commercial confidentiality constraints

### Personal Information
- `None expected`: dataset should not contain personal information
- `Possible`: dataset may contain personal information or quasi-identifiers
- `Present`: dataset contains personal information
- `Derived risk`: dataset may enable re-identification when linked with other data

## Register

| ID | Dataset | Purpose | Owner / Steward | Source / Acquisition Path | Status | Confidentiality | Personal Information | Permission Basis | Usage Restrictions | Storage Decision | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|
| D001 | Beachsafe-derived service data | Beaches, services, patrol/service context, service discovery | TBD | Beachsafe API / related public endpoints | Candidate | Public | None expected | TBD | Check terms of use, attribution, scrape constraints | Allowed if terms permit | Requires normalization and provenance tracking |
| D002 | ABS geography and demographic data | Population, demographics, geography | Australian Bureau of Statistics | ABS publications / downloads | Candidate | Public | None expected | ABS terms / attribution | Attribution and licence conditions must be recorded | Allowed if terms permit | Geography choice still TBD |
| D003 | SurfGuard member extract | Member affiliation, home-location basis, qualifications if provided | TBD | Periodic extract | Candidate | Restricted | Present | TBD | Must not store unnecessary personal data; use aggregation/de-identification | Not approved until permission and minimisation plan are defined | Direct feed unlikely |
| D004 | Branch Rescue Services asset/personnel data | Assets, operators, home-club attribution where known | TBD | Internal branch/state source | Candidate | Permissioned | Possible | TBD | May include personnel-linked information | Not approved until source and permission are confirmed | Completeness unknown |
| D005 | State / branch / club directories | Coverage baseline and reconciliation | TBD | Internal/public directory sources | Candidate | TBD | None expected | TBD | Record source-specific conditions | TBD | Needed for completeness checks |
| D006 | Visitation data | Historical/projected visitation and demand exposure | TBD | TBD | Candidate | TBD | None expected | TBD | Terms and allowed granularity must be recorded | TBD | Source not yet identified |
| D007 | Incident data | Rescues, fatalities, and possible other incident classes | TBD | TBD | Candidate | TBD | Possible | TBD | Avoid personal or case-level disclosure | TBD | Source not yet identified |
| D008 | Alternative activity / commitment data | Competing options for volunteer time | TBD | TBD | Candidate | TBD | None expected | TBD | Methodology must be fair and broadly applicable | TBD | Source not yet identified |

## Per-Dataset Template

Copy this block when a dataset moves beyond a simple register row.

### Dataset ID
- Dataset name:
- Purpose:
- Owner / steward:
- Source / acquisition path:
- Current status:
- Confidentiality classification:
- Personal information classification:
- Permission basis:
- Usage restrictions:
- Storage decision:
- Approved users / systems:
- Retention / deletion notes:
- Derived datasets:
- Related outputs:
- Review notes:

## Approval Checklist
- Owner or steward identified
- Source and acquisition path recorded
- Permission or legal basis recorded
- Confidentiality classification assigned
- Personal-information risk assessed
- Storage decision recorded
- Output/publication restrictions recorded
- Attribution requirements recorded
- If member-linked: minimisation or de-identification approach defined

## Review Notes
- No datasets are marked `Approved` yet.
- No dataset with personal information should be stored until a minimisation and privacy approach is documented.

## Change Log
- 2026-03-27: Created initial dataset register template.
