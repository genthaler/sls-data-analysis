# Agent Guide

## Purpose

This repository is for a context-aware surf lifesaving analysis system. Agents working here should prefer changes that preserve methodological clarity, explicit uncertainty, and readable project documentation.

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

## Documentation Map

- Primary requirements live in [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md).
- Open decisions and follow-up items live in [`docs/decision-queue.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/decision-queue.md).
- When changing requirements, update affected assumptions, risks, outputs, and open questions instead of appending isolated notes.

## Domain and Writing Expectations

- Keep confirmed requirements separate from provisional ideas and open questions.
- Do not present assumptions, inferred facts, or missing data as settled truth.
- Prefer explainable, reviewable methods over opaque optimisation.
- When adding or modifying analytical logic, keep method traceability explicit in code-adjacent docs or requirements notes.
- Preserve fairness language: the project is intended for context-aware comparison, not raw ranking by default.

## Working Style

- Make the smallest coherent change that keeps the repo consistent.
- Prefer updating existing documents over creating parallel sources of truth.
- If you discover ambiguity in data coverage, methodology, or attribution, surface it explicitly rather than guessing.
