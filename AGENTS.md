# Agent Guide

This file is for AI agents working in this repository. Use [`README.md`](/Users/bonj/Developer/Elm/sls-data-analysis/README.md) for project overview and document entry points.

## Project-Local Skills

- Project-local skills live under [`.agents/skills`](/Users/bonj/Developer/Elm/sls-data-analysis/.agents/skills).
- Check that folder before inventing repo-specific workflows.
- Current local skills include:
  - [`.agents/skills/git/SKILL.md`](/Users/bonj/Developer/Elm/sls-data-analysis/.agents/skills/git/SKILL.md) for git status, branch, and commit-message guidance.
  - [`.agents/skills/requirements-document/SKILL.md`](/Users/bonj/Developer/Elm/sls-data-analysis/.agents/skills/requirements-document/SKILL.md) for maintaining the living requirements document.

## Git Rules

- Treat `main` as PR-only.
- Create new work on `codex/*` branches unless the user explicitly asks for something else.
- Before summarising or suggesting a commit, inspect `git status --short` and the diff scope.
- Call out unrelated working tree changes rather than silently folding them into a commit summary.
- Prefer short imperative commit messages with prefixes such as `Fix:`, `Feature:`, `Documentation:`, `Refactor:`, `Style:`, or `Chore:`.

## Domain and Writing Expectations

- Keep confirmed requirements separate from provisional ideas and open questions.
- Do not present assumptions, inferred facts, or missing data as settled truth.
- Prefer explainable, reviewable methods over opaque optimisation.
- When adding or modifying analytical logic, keep method traceability explicit in code-adjacent docs or requirements notes.
- Preserve fairness language: the project is intended for context-aware comparison, not raw ranking by default.
- When changing requirements, update affected assumptions, risks, outputs, and open questions instead of appending isolated notes.

## Working Style

- Make the smallest coherent change that keeps the repo consistent.
- Prefer updating existing documents over creating parallel sources of truth.
- If you discover ambiguity in data coverage, methodology, or attribution, surface it explicitly rather than guessing.
