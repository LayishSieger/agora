# Agora plan

Status: repo + Mneme blueprint in progress. Agora steward skills authored; Euodia and execution bots not grilled.

## System

```
                    AGORA
            Creator + steward
         (thin public template)
                      │
                      │  fetches blueprints from
                      │  github.com/layishsieger/agora
                      ▼
       ┌──────────────┴──────────────┐
       │                             │
 CAREER FOUNDATION            CAREER EXECUTION
 (first-run)                  (lazy via need)
       │                             │
 ┌─────┴─────┐              ┌────────┴────────┐
 │           │              │                 │
EUODIA     MNEME         ZETESIS → HERMENEIA → KAIROS → MELETE → PEITHO
```

Progression: Find direction → Know yourself → Find opportunities → Understand them → Position yourself → Prepare → Negotiate.

## Roster

| Name | Title | One job |
|---|---|---|
| **Agora** | Bot Creator + steward | Create/configure/repair career-fleet bots and skills; route; quiet otherwise |
| **Euodia** | Career Pathfinder | Explore career direction and growth opportunities |
| **Mneme** | Career Curator | Maintain master career profile (source of truth) |
| **Zetesis** | Job Finder | Search relevant opportunities |
| **Hermeneia** | Job Decoder | Analyze JDs; explain fit |
| **Kairos** | Resume Tailor | Job-specific resume from master profile |
| **Melete** | Interview Coach | Interview prep and practice |
| **Peitho** | Offer Negotiator | Offer strategy and communication |

## Distribution

| Layer | What |
|---|---|
| **Public Grok Bot template** | Agora only — persona + skills to create/steward bots |
| **Source of truth** | `layishsieger/agora` — blueprints, skills, docs, telemetry |
| **First-run** | Agora creates Euodia + Mneme from repo blueprints |
| **Lazy** | `need <Name>` → Agora fetches blueprint → CreateAgent → install skills |
| **v2 (later)** | optional independent public templates per bot |

### Blueprint layout (repo)

```
bots/<name>/profile.md      # CreateAgent description
bots/<name>/skills/*.md     # installed after create
```

### Telemetry

- Two meters: **Agora registration** (installer in use) and **install event** (successful CreateAgent). Not zip downloads. Not template Add-as-CreateAgent.
- First turn: if `/workspace/bots/INSTALL_ID` missing and `DO_NOT_TRACK` unset, client-mint UUID, write the file, `GET /r?agora=1&id=` upsert, then CreateAgent as usual.
- After successful CreateAgent: one-shot `GET /t?event=install&bot=…&release=…&agora=1&id=…` (known id only). Ignore result. Never retry `/t`. Never block create.
- `DO_NOT_TRACK` skips `/r` and `/t`. Owner-only Blob. Agora registration counts untrusted until rate-limit. See ADR 0004 and 0010.

## Lifecycle

1. User installs thin Agora template.
2. First-run: Agora fetches Euodia + Mneme blueprints → CreateAgent → skills → install events.
3. Agora greets once, points to Euodia or Mneme, then quiets.
4. Later: stage SendToAgent Agora `need <Name>` → same path.
5. Only Agora may CreateAgent.

## Decisions

- Career-fleet only. Template owner: Layish. Fresh fleet on install.
- Euodia optional to use; Mneme always present; Euodia does not gate Mneme.
- Never fabricate. Never apply on the user's behalf.
- All authorship in `layishsieger/agora`.

## Mneme (foundation SoT)

One job: gather/organize/confirm career truth. No tailored HTML/markdown/PDF (including in chat), no JD scoring, no search, no CreateAgent, no apply.

Writes only:

- `/workspace/agora/profile.yaml` — identity
- `/workspace/agora/preferences.yaml` — wants (Euodia may propose; confirm before persist)
- `/workspace/agora/master-resume.md` — YAML story/evidence (`variant: master`)

Kairos writes `/workspace/agora/applications/resume_<company>_<role>.md`.

Intake v1: interview · resume/PDF · LinkedIn PDF/paste. Mixed JD+resume → evidence only. No fabricate. Re-import is union; conflicts are questions.

## Next

Author Euodia blueprint (`profile.md` + skills) so first-run can CreateAgent Euodia instead of recording `FAILED`. Execution-bot stubs after that.
