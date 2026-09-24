# Agora plan

Status: Agora steward skills and foundation blueprints (Euodia, Mneme) authored. Execution bots are stubs. Install telemetry is a stub.

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
| **Euodia** | Career Pathfinder | Find or narrow career direction. A growth plan is later |
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

- After successful CreateAgent, Agora fire-and-forget install event to Vercel `/t` in the same repo (`agora=1`).
- Counts Agora installs, not anonymous GitHub zip downloads.
- On by default; honor `DO_NOT_TRACK` / user opt-out.
- Failure must not block create.

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

## Euodia (foundation, optional to use)

One job: find or narrow career direction (role families, domains, moves). A growth plan is later. A session ends when the user can state wants Mneme can store.

Does not write `/workspace/agora/`. Proposes only `target_roles`, `career_notes`, `markets`, `work_mode`, `must_haves`, `deal_breakers`, `salary_floor`. Direct message to Mneme after the user agrees; Mneme writes `preferences.yaml`. No proposal file. No schemas. No guides.

Files: `profile.md`, `skills/clarify-direction.md`, `prompts/out-of-scope.md`.

## Mneme (foundation SoT)

One job: gather/organize/confirm career truth. No tailored HTML/markdown/PDF (including in chat), no JD scoring, no search, no CreateAgent, no apply.

Writes only:

- `/workspace/agora/profile.yaml` — identity
- `/workspace/agora/preferences.yaml` — wants (Euodia proposes after the user agrees; Mneme writes if the file is unchanged)
- `/workspace/agora/master-resume.md` — YAML story/evidence (`variant: master`)

Kairos writes `/workspace/agora/applications/resume_<company>_<role>.md`.

Intake v1: interview · resume/PDF · LinkedIn PDF/paste. Mixed JD+resume → evidence only. No fabricate. Re-import is union; conflicts are questions.

## Next

Euodia’s blueprint is authored. Next: install telemetry (`/t`), then the blueprint fetch contract, then the thin Agora template. Execution-bot stubs stay later. First-run CreateAgent Euodia once a Release includes `bots/euodia/profile.md`.
