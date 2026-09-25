# Agora plan

Status: Agora steward skills and foundation blueprints (Euodia, Mneme) authored. Thin installer **template recipe** authored (mint is Layish). Execution bots are stubs. Install telemetry server + client skill authored (Update template is Layish).

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
| **Agora** | Career assembly | Create/configure/repair career-fleet bots and skills; route; quiet otherwise |
| **Euodia** | Career pathfinder | Find or narrow career direction. A growth plan is later |
| **Mneme** | Career curator | Maintain master career profile (source of truth) |
| **Zetesis** | Job finder | Search relevant opportunities |
| **Hermeneia** | Job decoder | Analyze JDs; explain fit |
| **Kairos** | Resume tailor | Job-specific resume from master profile |
| **Melete** | Interview coach | Interview prep and practice |
| **Peitho** | Offer negotiator | Offer strategy and communication |

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

<<<<<<< HEAD
Thin Agora **template recipe** includes Install telemetry. Blueprint fetch contract is in steward skills. Layish Publishes (or **Update template** if an earlier mint skipped telemetry) from `docs/agents/agora-template-mint.md`. Pre-authored `bots/<slug>/avatar.png` files are a later assets PR. Execution-bot stubs stay later. First-run CreateAgent Euodia once a Release includes `bots/euodia/profile.md` (`no_release` until then is correct). Custom domain / public stats / Firewall rate-limit for telemetry stay out of v1.
=======
Thin Agora **template recipe** is authored (self-materialize + mint checklist + fleet identity). Blueprint fetch contract is in steward skills. Layish Publishes / Updates from the mint checklist. **Install telemetry client bytes** + Update template: open PR / grill closed — do not reopen the `/r` `/t` contract. Pre-authored `bots/<slug>/avatar.png` files are a later assets PR. **Now (grill only):** execution-bot **stubs** (Zetesis → Peitho) — `docs/execution-stubs-grill.md`; do **not** author those blueprints until Layish says **implement**. Latest Release already includes Euodia `profile.md`; execution folders are still README-only (`missing_profile` on `need` until stubs ship in a later Release).
>>>>>>> f650eff (docs: grill execution-bot stubs (Round 1, wait to implement))
