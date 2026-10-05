# Agora plan

Status: Agora steward skills and foundation blueprints (Euodia, Mneme) authored. Euodia has clarify-direction + navigate-progress; sole-writes `journey.md`. Execution stubs (Zetesis→Peitho) authored with one job skill each. Mneme sole-writes masters + `story-bank.md`. Thin installer **template recipe** authored (mint is Layish). Install telemetry server + client skill authored (Update template is Layish). **Release after merge** so CreateAgent can fetch stubs.

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
(navigator)              (gated auto; hard stop before Melete)
```

Progression: Find direction → Know yourself → Find opportunities → Understand them → Position yourself → (user applies) → Prepare → Negotiate. Navigator seats Melete/Peitho via routines after apply-commit / on offer.

## Roster

| Name | Title | One job |
|---|---|---|
| **Agora** | Career assembly | Create/configure/repair career-fleet bots and skills; route; quiet otherwise |
| **Euodia** | Career pathfinder + navigator | Direction + journey/seating/routines/connectors |
| **Mneme** | Career curator | Maintain masters + story-bank (source of truth) |
| **Zetesis** | Job finder | Search relevant opportunities; write jobs/ |
| **Hermeneia** | Job decoder | Analyze JDs; match vs M=70 / N=80; write jd-bank/ |
| **Kairos** | Resume tailor | Job-specific resume + HTML loader under applications/ |
| **Melete** | Interview coach | Interview prep; propose stories for story-bank |
| **Peitho** | Offer negotiator | Compare + negotiate; write offer-bank/ and deal-bank/ |

## Distribution

| Layer | What |
|---|---|
| **Public Grok Bot template** | Agora only — frozen **template recipe** (short Share description + six skills: First-run, Need bot, Fetch blueprint, Apply fleet identity, Install telemetry, Agora persona). Share `gettingStarted` → First-run. Mint: `docs/agents/agora-template-mint.md` |
| **Source of truth** | `layishsieger/agora` — blueprints, skills, docs, telemetry |
| **First-run** | Self-materialize `/workspace/bots/agora/`, then CreateAgent Euodia + Mneme from repo blueprints |
| **Lazy** | Stage bot messages Agora `need <Name>` → Agora fetches blueprint → CreateAgent → install skills |
| **v2 (later)** | optional independent public templates per bot |

### Blueprint layout (repo)

```
bots/<name>/profile.md      # CreateAgent description
bots/<name>/skills/*.md     # installed after create
```

### Telemetry

- Client skill `bots/agora/skills/install-telemetry.md`: first turn if `/workspace/bots/INSTALL_ID` missing and `DO_NOT_TRACK` unset, client-mint UUID, write the file, `GET /r?agora=1&id=` upsert, then CreateAgent as usual. After successful CreateAgent: one-shot `GET /t?event=install&bot=…&release=…&agora=1&id=…` (known id only). Ignore result. Never retry `/t`. Never block create.
- `DO_NOT_TRACK` skips `/r` and `/t`. Owner-only Blob. Agora registration counts untrusted until rate-limit. See ADR 0004 and 0010.
- Hosting: Vercel project `agora`, production `https://agora-layish-siegers-projects.vercel.app`. Custom domain / public stats / Firewall rate-limit remain out of v1 (Layish later).

## Lifecycle

1. User Adds the thin Agora **installer template**.
2. First-run: Agora self-materializes its playbooks, registers install id (`/r` unless DNT), fetches Euodia + Mneme blueprints → CreateAgent → skills → one-shot `/t` on success.
3. Agora greets once, points to Euodia or Mneme, then quiets.
4. Later: stage SendToAgent Agora `need <Name>` → same path.
5. Only Agora may CreateAgent. Never CreateAgent Agora.

## Decisions

- Career-fleet only. Template owner: Layish. Fresh fleet on install.
- Euodia optional to use; Mneme always present; Euodia does not gate Mneme. Euodia is also navigator from first-run.
- Never fabricate. Never apply on the user's behalf.
- Gated auto-pipeline: G1 confirm-once; G2 user-pick; G3 M=70 N=80; G4 no auto to Melete; N9 Peitho on offer; G7 stop-only default; G8 pointer DMs; G9 need-then-continue.
- All authorship in `layishsieger/agora`.

## Euodia (foundation + navigator)

Skills: clarify-direction (role families, domains, moves) and navigate-progress (journey, seating, routines, connectors).

Does not write masters. Proposes only `target_roles`, `career_notes`, `markets`, `work_mode`, `must_haves`, `deal_breakers`, `salary_floor` for Mneme. Sole-writes `/workspace/agora/journey.md`.

Files: `profile.md`, `skills/clarify-direction.md`, `skills/navigate-progress.md`, `prompts/out-of-scope.md`.

## Mneme (foundation SoT)

One job: gather/organize/confirm career truth. No tailored HTML/markdown/PDF (including in chat), no JD scoring, no search, no CreateAgent, no apply. Specialist asks: refuse + DM.

Writes only:

- `/workspace/agora/profile.yaml` — identity
- `/workspace/agora/preferences.yaml` — wants (Euodia proposes after the user agrees; Mneme writes if the file is unchanged)
- `/workspace/agora/master-resume.md` — YAML story/evidence (`variant: master`)
- `/workspace/agora/story-bank.md` — reusable interview stories (Melete proposes; Mneme writes after confirm)

Kairos writes `/workspace/agora/applications/resume_<company>_<role>.md` (+ simple HTML loader).

Intake v1: interview · resume/PDF · LinkedIn PDF/paste. Mixed JD+resume → evidence only. No fabricate. Re-import is union; conflicts are questions.

## Execution stubs

Each of Zetesis, Hermeneia, Kairos, Melete, Peitho has `profile.md`, one job skill, `prompts/out-of-scope.md`, `README.md`. Banks: jobs/, jd-bank/, applications/, offer-bank/, deal-bank/. Deep toolkit later.

## Next

1. **Merge this implement PR**, then publish a **new GitHub Release** (after v0.1.2) including stub trees + Euodia navigate updates so CreateAgent / `need` can fetch them.
2. Layish Publishes (or **Update template**) from `docs/agents/agora-template-mint.md` when ready.
3. Pre-authored `bots/<slug>/avatar.png` files remain a later assets PR.
4. Deepen toolkits later (Hermeneia → Zetesis → Kairos → Melete → Peitho → navigator polish).
5. Custom domain / public stats / Firewall rate-limit for telemetry stay out of v1.
