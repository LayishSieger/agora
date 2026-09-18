# ADR 0002 — Agora steward, CreateAgent monopoly, need protocol

## Status

Accepted

## Context

After install, a pure creator bot feels disposable. Giving CreateAgent to stage bots (or to Euodia) blurs one-job boundaries. Stages still need a way to obtain the next bot in the pipeline.

## Decision

Agora remains installed as a thin fleet steward. Only Agora may CreateAgent. When a stage needs another fleet bot, it messages Agora `need <Name>`; Agora creates if missing and returns the id. Agora greets once on first-run, then stays quiet unless asked or needed.

## Consequences

Day-to-day career work happens in stage bots. Agora chat stays short. Stage bots must know the next name in the pipeline and must not create bots themselves.
