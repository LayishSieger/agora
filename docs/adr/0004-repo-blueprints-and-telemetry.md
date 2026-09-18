# ADR 0004 — Blueprints in layishsieger/agora; thin Agora template; Agora install telemetry

## Status

Accepted

## Context

Packing every child persona and skill into the public Agora template couples updates to template republishing and confuses the build repo with the install surface. Raw GitHub release download counts cannot attribute installs to Agora. skills.sh-style CLI telemetry counts installs via an explicit client signal.

## Decision

1. Author everything in public repo `layishsieger/agora`.
2. Public Grok Bot template ships thin Agora only (persona + create/steward skills).
3. On create/need, Agora fetches `bots/<name>/profile.md` and skills from that repo (tagged release zip or equivalent HTTPS), then CreateAgent and installs skills.
4. After successful CreateAgent, Agora sends an anonymous install event to a Vercel `/t` route in the same repo, marked as Agora (`agora=1`). Telemetry on by default; honor `DO_NOT_TRACK`. Telemetry failure must not block install.
5. Independent public templates per child bot are deferred to v2.

## Consequences

Updating Mneme is a repo change + release, not an Agora template republish. Install stats reflect Agora creates. Installers need network access to GitHub and the telemetry host.
