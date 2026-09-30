---
cursor:
  subagentId: "bc-842b45c1-d54c-5fc8-8380-f7aa7f27ca75"
---

# Grill — Career-execution stubs (Zetesis → Peitho)

**Status:** Round 1 **closed enough to open Round 2 (seams)**. Grill only. **Do not implement** stubs until Layish says **implement**.

**PR:** [github.com/LayishSieger/agora/pull/9](https://github.com/LayishSieger/agora/pull/9) · branch `cursor/execution-stubs-grill-37ff`

**Companion:** [execution-stubs-grill-questions.md](/cursor/stores/bc-091fb2c1-527d-4cb8-91ee-9e1d4b9cf525/docs/execution-stubs-grill-questions.md)

Answers: letter + one line if you override. Grok asks **one question at a time**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Agora = thin installer; only Agora CreateAgent | ADR 0001, 0002, 0004, 0006 |
| Children from latest GitHub Release + CreateAgent | ADR 0004, 0006, 0007 |
| First-run = Euodia + Mneme only; execution lazy `need <Name>` | ADR 0003 |
| User never types `need`; stage bots message Agora | ADR 0017 |
| Roster one-jobs; never fabricate; never apply | AGORA-PLAN |
| Mneme sole-writes master files; Kairos sole-writes `applications/resume_<company>_<role>.md` | ADR 0005 |
| Title chips via Apply fleet identity (not CreateAgent) | ADR 0016 — was R1-Q3 |
| **Q2 = A** — all five stubs: only `prompts/out-of-scope.md` (no extra in-scope prompts this round) | Layish |
| **Q4 = A for now** — Euodia-sized durable rules in the profile **content**; shorten after testing | Layish |
| **Q5 = A** — Naive one-job with hard anti-jobs | Layish |
| **Q6 = A** — Only Kairos writes durable files; only that applications path | Layish |
| **Q7 = A** — Refuse + message bot or Agora `need <Name>` **on ask**; no auto-pipeline; never coach user to type `need` | Layish |
| **Q8 = A** — Next Release after implement includes creatable stubs | Layish |
| **Q9 = A** — One implement PR for all five | Layish |

### Q1 — instruction / CreateAgent description (settled **for now**, testing may reverse)

**Layish:** Doesn’t know yet; needs testing. **For now: profile-only** — shorter, different structure, more compact, **not markdown-heavy**; it should simply state the job the bot needs to do. May change after testing.

**Mapped working assumption (not Euodia-shaped “fat profile as instruction”):**

| Layer | Working assumption now |
|---|---|
| CreateAgent **description / instructions** | Compact **job blurb** (plain, not markdown-heavy). States the one job. **Not** a paste of a full Euodia-length markdown profile. |
| Durable rules content (anti-jobs, voice, pointers) | Still **Euodia-sized for now** (Q4 = A), but may live **outside** that short CreateAgent blurb (skill and/or disk `profile.md` / out-of-scope) — exact file split is the leftover below. |
| `prompts/out-of-scope.md` | **Ships** for all five (Q2 = A); disk refusal playbook, not the CreateAgent description. |
| Agora mint pattern | Unrelated for children **for now**: Agora stays short `share-description` + Agora persona skill (ADR 0016). Children are **not** adopting that persona-skill pattern until testing says so. |

This is **not** “ship five Euodia-shaped trees with full profile.md as CreateAgent description.” File inventory still has one open letter (Round 1 leftover below).

### Round 1 leftover — one follow-up (file depth)

**R1-Q1b** (answer before implement): Given compact CreateAgent blurb + required `prompts/out-of-scope.md`, does each stub still ship **one job skill** (`skills/*.md` enabled on CreateAgent)?

**A.** **Yes — one job skill** + disk `out-of-scope.md` + compact CreateAgent blurb (and optionally a fuller on-disk `profile.md` the child can open). Closest to Euodia’s *files*, but description stays compact.

**B.** **No skill file.** Compact CreateAgent blurb only + disk `out-of-scope.md`. Behavior is model + blurb + opening out-of-scope when refusing.

➡️ Prefer **A** so the one-job playbook isn’t improvised; still Layish’s letter.

---

## Seam audit (evidence only — Layish priority)

Question: *Do we have well-defined seams so bots know when to talk to each other?*

| Handoff | Status | Why (one sentence) |
|---|---|---|
| **Euodia → Mneme** | **settled** | Euodia grill + skill: after user agrees, DM Mneme with old/new wants keys only; Mneme writes / race-checks; if Mneme missing → Agora `need Mneme`. |
| **Mneme → Euodia** | **settled** | Mneme anti-jobs / out-of-scope: direction workshopping is Euodia; Mneme may store confirmed wants, not debate path. |
| **Euodia → execution (Zetesis…)** | **settled** | On ask only: refuse sibling job; DM that bot with ask + relevant wants, else Agora `need <Name>`; firm direction alone messages nobody. |
| **Mneme → execution** | **mushy** | Refuse + Agora `need <Name>` if missing is locked; unlike Euodia, scripts often say “open Kairos when it exists” and do **not** require a DM payload of wants/ask to the specialist. |
| **Any stage → Agora `need`** | **settled** | ADR 0002 + need-bot + Q7 A: one Latin name; user never types `need`; execution `need` waits until Mneme exists. |
| **Auto whole-pipeline create** | **settled (forbidden)** | Quantifiers refused; Q7 A forbids auto-`need` when a stub “thinks” the stage is done. |
| **Zetesis → Hermeneia** | **missing** | One-jobs named; Q7 A says forward only on ask; **no** stub blueprint and **no** payload (which opening / JD text / constraints). |
| **Hermeneia → Kairos** | **missing** | No decode→tailor contract (what company/role/JD notes Kairos receives); only Kairos write path is settled (Q6 A / ADR 0005). |
| **Kairos → Melete** | **missing** | No prep handoff; unsettled whether Melete should read `applications/resume_*`, master files, or chat-only. |
| **Melete → Peitho** | **missing** | No offer handoff (what offer text / role / resume context). |
| **Execution stubs’ anti-job tables** | **mushy** | Roster + never apply/fabricate/CreateAgent are settled at plan/ADR level; per-stub out-of-scope scripts **do not exist yet** (README-only folders). |

**Verdict for Layish:** Foundation seams (Euodia↔Mneme, Euodia→others, Agora `need`, no auto-pipeline) are **strong**. Execution-chain handoffs are **mostly missing** — that is the right Round 2 frontier. Mneme→specialist DM vs “point at chat” is the main foundation **mush**.

---

## Round 2 — seams only

❓ **R2-Q1** - **Mneme → specialist: DM or point?**

When the user asks Mneme for Zetesis/Hermeneia/Kairos/Melete/Peitho work:

**A.** **Match Euodia:** refuse in Mneme chat; if bot exists, **DM** it with the ask (+ relevant stored wants / facts pointers); if missing, Agora `need <Name>`.

**B.** **Point only:** refuse; tell user which chat to open; Agora `need <Name>` if missing; **no** specialist DM from Mneme.

**C.** **Mixed:** DM only for some names (e.g. Kairos), point for others.

➡️ **A** — one handoff language across foundation bots. **B** is what several Mneme refusal lines read like today.

---

❓ **R2-Q2** - **Zetesis → Hermeneia payload (on ask to decode / move on)**

**A.** DM Hermeneia with: the chosen opening identity (company, role, URL or pasted JD text) + pointer that wants live in Mneme’s files. No new durable file (Q6 A).

**B.** Chat-only refuse + `need Hermeneia` / point; user re-pastes the JD in Hermeneia. No DM payload.

**C.** Defer payload until a Zetesis/Hermeneia product grill; stub out-of-scope only names Hermeneia.

➡️ **A** if smooth process matters now; **C** if stubs stay name-redirect only.

---

❓ **R2-Q3** - **Hermeneia → Kairos payload (on ask to tailor)**

**A.** DM Kairos with company + role + JD text (or path/URL already in the thread) and tell Kairos to read master files; Kairos writes only `applications/resume_<company>_<role>.md`.

**B.** Point / `need Kairos` only; user re-supplies company/role/JD in Kairos chat.

**C.** Defer to a Hermeneia/Kairos product grill.

➡️ **A** pairs with smooth tailor after decode; still no new SoT files.

---

❓ **R2-Q4** - **Kairos → Melete: what may Melete read on ask to practice?**

**A.** Melete may read `/workspace/agora/` master files **and** the relevant `applications/resume_*` if it exists; Kairos DMs Melete with company/role (+ path).

**B.** Melete reads master files only; job-specific resume stays Kairos chat unless user pastes it.

**C.** Chat/DM context only for stubs; no required file reads beyond what the user pastes.

➡️ **A** if interview prep should match the tailored packet; **C** keeps stubs thinner.

---

❓ **R2-Q5** - **Melete → Peitho payload (on ask to negotiate)**

**A.** DM Peitho with offer text (or user-pasted terms) + company/role; Peitho may read master files; still **no** offer log file (Q6 A).

**B.** Point / `need Peitho` only; user re-pastes the offer in Peitho.

**C.** Defer to a Melete/Peitho product grill.

➡️ **A** for continuity; **B/C** if stub round stays redirect-only.

---

❓ **R2-Q6** - **What counts as “on ask” to forward to the next execution bot?**

**A.** Only an explicit ask for that bot’s job or name (“decode this,” “need Hermeneia,” “tailor for Acme”).

**B.** Also soft stage-complete lines (“I’m ready for the next step,” “let’s move on”) → forward to the **next** pipeline name (Zetesis→Hermeneia→…).

**C.** Stubs never forward; they only refuse sibling jobs and `need` when the user named a missing bot (narrower than Q7 A’s “forward next on ask”).

➡️ **A** is safer against stealth pipeline. **B** is smoother but fuzzier. Confirm against Q7 A.

---

## Stop

Do **not** author execution blueprints until **implement**. Finish **R1-Q1b** + Round 2 letters first. No invented seam payloads beyond what Layish picks above.
