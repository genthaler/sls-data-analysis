---
name: requirements-document
description: Use when creating or updating a living requirements markdown document for a project. Enforces document structure, clear status labels, explicit assumptions and open questions, fairness/context checks, and progressive handling of incomplete data.
---

# Requirements Document

Use this skill when the user wants a requirements document, spec, project brief, scope definition, or structured elicitation notes that will evolve over time.

## Goal

Keep the requirements document useful as a living source of truth without letting it degrade into mixed notes, hidden assumptions, or advocacy.

## Workflow

1. Locate the current requirements document, or create one from the template at `references/requirements-template.md` if none exists.
2. Preserve the document as Markdown in the repo.
3. Keep confirmed requirements separate from provisional ideas, assumptions, and open questions.
4. When updating the document, revise existing sections before appending new notes.
5. Add a short decision-log entry when a previously open point becomes decided.

## Mandatory Guardrails

- Every major section must distinguish between `Confirmed`, `Provisional`, and `Open` content where relevant.
- Do not present assumptions or inferred facts as confirmed requirements.
- Every major requirement should be stated in terms of outcome or constraint, not just a note fragment.
- Record missing data and unresolved dependencies explicitly.
- Do not treat missing data as zero, absence, or lack of need.
- For comparison or evaluation systems, state whether comparisons are raw, peer-group, or context-adjusted.
- For fairness-sensitive work, include a check that the document does not implicitly support only one stakeholder position.
- When a new requirement is added, also update affected sections if applicable:
  - `Data Sources`
  - `Outputs`
  - `Assumptions and Risks`
  - `Open Questions`

## Writing Rules

- Prefer concise, testable statements.
- Use `shall` for mandatory requirements, `should` for strong preferences, and `may` for optional or deferred items.
- Keep note fragments out of the main requirements sections; convert them into clear statements.
- Separate:
  - observed facts
  - modelled/inferred concepts
  - policy or interpretation
- Call out uncertainty when source data, definitions, or methodology are not settled.

## Fairness Check

When the project compares teams, organisations, regions, or people, verify that the document answers all of these:

- What entities are being compared?
- On what basis are they comparable?
- What contextual factors could make raw comparison misleading?
- What missing data could invalidate or weaken comparison?
- How can the framework show both underperformance and unrealistic expectations?

If any answer is missing, add it to `Open Questions` or `Assumptions and Risks`.

## Data Completeness Check

For each important output, identify:

- required inputs
- optional/enriching inputs
- what can still be reported if some inputs are missing
- what caveat must be shown

## Recommended File Shape

Use the template in `references/requirements-template.md` unless the repo already has a stronger established format.

## Update Discipline

When editing an existing requirements document:

- normalize terminology before adding new sections
- merge duplicate open questions
- remove or relabel stale provisional statements
- keep the document readable by non-developers

## What Not To Do

- Do not dump raw elicitation notes into the main spec unchanged.
- Do not hide major unresolved issues inside prose.
- Do not allow stakeholder framing to become a requirement unless the user explicitly wants advocacy.
- Do not add metrics without stating what data they depend on.
