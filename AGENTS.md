# Agent Guide

This file is for AI agents working in this repository. Use [`README.md`](README.md) for project overview and document entry points.

## Repo Scope

Keep this file limited to repository-specific conventions. Put generic workflow preferences in `~/.codex/AGENTS.md` and detailed procedures in skills.

## Local Skills

- Check [`.agents/skills`](.agents/skills) before inventing repo-specific workflows.
- Use [`.agents/skills/requirements-document/SKILL.md`](.agents/skills/requirements-document/SKILL.md) when creating or updating the living requirements document.

## Repository Conventions

- Treat `main` as PR-only.
- Create new work on `codex/*` branches unless the user explicitly asks for something else.
- Preserve the project's fairness framing: default to context-aware comparison, not raw ranking.
- When analytical logic or requirements change, keep method traceability explicit in repo docs or requirements notes.
