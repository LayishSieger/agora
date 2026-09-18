# ADR 0003 — First-run creates Euodia and Mneme; execution bots are lazy

## Status

Accepted

## Context

Creating the full roster up front wastes bots the user may not reach. Creating only Mneme leaves pathfinding uninstalled. Euodia must not gate whether Mneme exists.

## Decision

First-run creates Euodia and Mneme (foundation). Zetesis through Peitho are created later by Agora when messaged `need <Name>`. Euodia is optional to use when direction is unclear; Mneme is always present as career-profile truth.

## Consequences

Install surface stays small. Pathfinding and truth are both available immediately. Execution capacity grows with progress.
