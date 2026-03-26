# sls-data-analysis

Context-aware analysis system planning for surf lifesaving clubs, branches, and related services across Australia.

## Status

This repository is currently documentation-first. It defines the project scope, analytical intent, open decisions, and repo-specific working conventions before implementation work begins.

## Project Goal

The project aims to support fair, context-aware comparison across surf lifesaving organisations rather than raw ranking by default. The current requirements focus on:

- club, branch, state, NSW Metro/Country, and national analysis
- patrol and service inventory
- catchment, travel, visitation, and incident analysis
- cross-service reporting for branch Rescue Services assets and personnel
- explicit handling of incomplete data, assumptions, and comparison limits

## Repository Map

- [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md): living requirements document and methodology framing
- [`docs/decision-queue.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/decision-queue.md): unresolved decisions that affect scope, modelling, and implementation order
- [`AGENTS.md`](/Users/bonj/Developer/Elm/sls-data-analysis/AGENTS.md): repository-specific instructions for AI agents

## How To Read This Repo

If you are new to the project:

1. Start with [`docs/requirements.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/requirements.md) to understand the intended system and current assumptions.
2. Read [`docs/decision-queue.md`](/Users/bonj/Developer/Elm/sls-data-analysis/docs/decision-queue.md) to see which unresolved questions still shape the design.
3. If you are an AI agent making repo changes, then read [`AGENTS.md`](/Users/bonj/Developer/Elm/sls-data-analysis/AGENTS.md).

## Current Scope Boundaries

The current requirements explicitly exclude some areas from the initial implementation, including:

- direct real-time SurfGuard integration
- automated operational rostering decisions
- prescriptive member redistribution unless explicitly introduced later

## Implementation Note

There is no application code in the repository yet. The current priority is to keep the requirements, decision log, and repo conventions coherent enough to support later ingestion, modelling, and reporting work.
