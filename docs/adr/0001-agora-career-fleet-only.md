# ADR 0001 — Agora is a career-fleet creator, not a general bot designer

## Status

Accepted

## Context

Agora was described as a bot creator. A general bot creator overlaps a separate meta designer role. The Agora product must install cleanly for new users as its own fleet.

## Decision

Agora creates, configures, and manages only the career pipeline bots (Euodia through Peitho) and their skills. The installing user gets a new fleet. Layish owns the Agora template.

## Consequences

Agora's first-run and routines stay inside the career system. General bot-design work stays elsewhere.
