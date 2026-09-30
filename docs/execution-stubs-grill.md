---
cursor:
  subagentId: "bc-842b45c1-d54c-5fc8-8380-f7aa7f27ca75"
---

# Grill — Career-execution stubs (Zetesis → Peitho)

**Status:** Round 1 **partially settled**. Grill only. **Do not implement** `bots/zetesis|hermeneia|kairos|melete|peitho/` until Layish says **implement**.

**PR:** [github.com/LayishSieger/agora/pull/9](https://github.com/LayishSieger/agora/pull/9) · branch `cursor/execution-stubs-grill-37ff`

**Companion (letters only):** [execution-stubs-grill-questions.md](/cursor/stores/bc-091fb2c1-527d-4cb8-91ee-9e1d4b9cf525/docs/execution-stubs-grill-questions.md)

Answers: letter + one line if you override. Grok asks **one question at a time**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Agora = thin installer; only Agora CreateAgent | ADR 0001, 0002, 0004, 0006 |
| Children from latest GitHub Release + CreateAgent | ADR 0004, 0006, 0007 |
| First-run = Euodia + Mneme only; execution is lazy `need <Name>` | ADR 0003 |
| Execution `need` waits until Mneme exists | need protocol |
| User never types `need`; stage bots message Agora; no user coaching | ADR 0017 |
| Roster one-jobs + never fabricate / never apply | AGORA-PLAN |
| Mneme sole-writes master files; Kairos sole-writes `applications/resume_<company>_<role>.md` | ADR 0005 |
| README-only → `missing_profile` | fetch-blueprint |
| Zero skills allowed if `profile.md` exists | need-bot |
| Whole `bots/<slug>/` tree extracted; child reads disk prompts/guides/schemas | ADR 0008 |
| Child-only Releases do not Update the Agora template | thin-template |
| Stage bots never CreateAgent | ADR 0002 |
| **Title chips** for Zetesis–Peitho already locked in Apply fleet identity; CreateAgent/UpdateAgent set name+description only | ADR 0016 — was R1-Q3 |
| **Q5 = A** — Naive one-job with hard anti-jobs (not refuse-until-full; Kairos may write) | Layish, this turn |
| **Q6 = A** — Only Kairos writes durable files; only `applications/resume_<company>_<role>.md` | Layish, this turn |
| **Q7 = A** — Refuse + message bot or Agora `need <Name>` on ask; no auto-pipeline; never coach user to type `need` | Layish, this turn |
| **Q8 = A** — Next Release after implement includes creatable stubs; first-run still foundation-only | Layish, this turn |
| **Q9 = A** — One implement PR for all five stubs after close | Layish, this turn |
| Do not reopen fetch / telemetry `/r` `/t` / Add recipe packing | those grills |

### Verification — Agora instruction vs `profile.md` (looked up; not a vote)

**True for the published Agora template (current `main`):**

| Piece | What ships |
|---|---|
| Share / Instructions / description | **Short** `bots/agora/share-description.md` (~0.4k). Mint: “Do **not** paste `profile.md` here” (`docs/agents/agora-template-mint.md`) |
| Standing identity | Skill **Agora persona** = full `profile.md` body (`agora-persona.md`) |
| ADR | **0016** — short storefront; long ONE JOB / roster / anti-jobs in Agora persona. Supersedes thin-template “preview is `profile.md`” |
| Glossary | **template recipe** / **Agora persona** in `CONTEXT.md` |

**Different for children today (Euodia, Mneme, and any `need` create):**

| Piece | What ships |
|---|---|
| CreateAgent **description** | Fetched `profile.md` **verbatim** (`first-run.md`, `need-bot.md`, glossary **CreateAgent**) |
| Grok skills | Every `skills/*.md` enabled |
| `prompts/out-of-scope.md` | Left on disk under `/workspace/bots/<slug>/`; child opens it when refusing — **not** the CreateAgent description, **not** a separate Grok skill in the Euodia/Mneme trees |

So: Layish’s memory is right for **Agora Add**. It is **not** how children are wired today. Whether stubs (and/or Euodia/Mneme) should match Agora is **open Q1** below. Do not invent a child short-blurb path that does not exist yet.

## Facts (other)

- Execution folders on `main` / latest Release `v0.1.1` are README-only → `need Zetesis` → `missing_profile`.
- Euodia thin-child **files:** `profile.md` (~2.3k) + one skill + `prompts/out-of-scope.md` + README.
- Telemetry client bytes on `main` (#13). Template Publish/Update is Layish’s.

## Design tree (remaining Round 1 frontier)

```
execution stubs
├── CreateAgent instruction wiring     ← Q1 (clarified)
├── what is prompts/out-of-scope?      ← Q2 (clarified; then A/B/C)
├── Title / H1                         ← settled ADR 0016
├── how fat is profile.md / blurb      ← Q4 (clarified; hang off Q1)
├── naive one-job                      ← settled Q5 A
├── durable files                      ← settled Q6 A
├── need-next handoffs                 ← settled Q7 A
├── next Release includes stubs?       ← settled Q8 A
└── authoring batch                    ← settled Q9 A
```

---

## Round 1 — still open (answer these)

### ❓ **Q1** — CreateAgent **instruction** vs `profile.md` (files + wiring)

You leaned **Euodia-shaped files** (profile + one job skill + out-of-scope + README). Separate product question: **what goes in the child’s CreateAgent description / instructions field?**

**A.** **Keep today’s child path (status quo).** CreateAgent description = full `profile.md` verbatim. Enable the one job skill. `prompts/out-of-scope.md` stays on disk only. Same as Euodia/Mneme/`need-bot` now. **No** steward-skill change for stubs.

**B.** **Agora-shaped for children too.** Short CreateAgent blurb (new per-child file, e.g. `share-description.md` or equivalent) + standing **persona** skill whose body is full `profile.md` + one job skill + out-of-scope on disk. Stubs (and, if you say so, Euodia/Mneme) match the installer pattern. **Requires** teaching `first-run` / `need-bot` a short-blurb source (reopens steward skills — not “stubs only”).

**C.** **Short CreateAgent blurb + full `profile.md` on disk only** (no persona skill). Description is minimal and points at `/workspace/bots/<slug>/profile.md`. Relies on the child opening the file. No duplicate persona skill. Still needs steward wiring for the short blurb.

**D.** **Defer instruction wiring.** Ship Euodia-shaped **files** under today’s verbatim-`profile.md` CreateAgent rule for this stub batch. Re-grill Agora-shaped child instructions as a separate steward/foundation frontier (could include migrating Euodia/Mneme).

➡️ **A** if you want stubs to ship without reopening `need-bot`. **B** if matching Agora’s “minimal instruction + persona skill” matters more than keeping steward skills frozen. **D** if you want files now and wiring later. Do not pick silently.

---

### ❓ **Q2** — What is the “prompt”? (`prompts/out-of-scope.md`)

In Euodia / Mneme / Agora, `prompts/out-of-scope.md` is **not** the bot’s system instruction and **not** the CreateAgent description.

It is a **refusal playbook on disk**: detection cues + canned refuse lines for sibling jobs / apply / fabricate / CreateAgent. The child (or skill) opens it when the user asks out of scope. Example Euodia line: *“I don’t search openings. That’s Zetesis.”*

One-line example of what would live there for **Zetesis**:

> I don’t tailor resumes or write `applications/` — that’s Kairos. I won’t draft a job-specific resume here.

After that clarification, pick how many prompt files the stub round gets:

**A.** All five: only `prompts/out-of-scope.md`. No interview-drill / offer-email / JD-paste in-scope prompt files until a later per-bot grill.

**B.** All five get out-of-scope; **Melete and Peitho** also get **one** in-scope prompt each this round.

**C.** No `prompts/` directory (only coherent if you also chose profile-only or skill-without-prompts for file shape — and only after Q1’s file inventory is clear).

➡️ **A** — identical stub contract; extra prompts are product depth.

---

### ❓ **Q4** — How fat is `profile.md` (and what is “short”)?

Depends on **Q1**. You said **A but maybe short**.

**If Q1 = A or D** (description = full `profile.md` today):

- **A.** **Euodia-sized profile** (~2k): ONE JOB, voice, anti-jobs table, pointer to the one skill. Do not paste the full skill into `profile.md`.
- **B.** **Agora-profile-short** (~1k): one-job + thin anti-jobs + pointers; detail lives in the job skill (and out-of-scope on disk).
- **C.** Long operational novel in `profile.md` (full workflow) — avoid.

**If Q1 = B** (Agora-shaped children):

- Short CreateAgent blurb ≈ Agora `share-description.md` scale (a paragraph).
- Full rules live in the **persona skill** (body = `profile.md`). Then “how fat is profile” = how fat that persona skill is — same **A/B/C** scale as above for the persona body.

**If Q1 = C** (short blurb + disk profile only):

- Blurb stays tiny; **A/B/C** apply to the on-disk `profile.md` the child is told to open.

➡️ Still prefer **A** for the durable rules file (whether it is CreateAgent description or persona body). Pick **B** if you want the standing text thinner and the job skill to carry more. Do not force A.

---

## Stop

No blueprint authoring until **implement**. Round 2 only after Q1 / Q2 / Q4 letters land (skill filenames if file shape ≠ Euodia-shaped; steward changes if Q1 = B or C).
