# Grill — Thin Agora public template (installer Add link)

Status: **round 1 asked; answers not in yet.** Do not implement the export pack, mint an `x.ai/bot/…` link, or change CreateAgent wiring until this grill is closed and someone says **implement**.

This grill is the **installer template**: the one published Grok Bot recipe users Add. It is **not** child blueprints, not fetch zipball internals, not `/t` protocol, not Euodia/Mneme one-jobs.

Answers: letter + one line if you override the recommendation.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Only public Grok Bot template in v1 is **Agora** (installer). Children are **not** published as their own templates | ADR 0004, ADR 0006, glossary **installer template** |
| User Adds Agora once; Agora **CreateAgent**s children from GitHub blueprints | ADR 0004, **CreateAgent** |
| Template ships **thin** Agora: persona + create/steward skills — not the whole fleet packed into Add | ADR 0004, `AGORA-PLAN.md` Distribution |
| First-run creates Euodia + Mneme, greets **once**, then quiet; execution bots are lazy `need` | ADR 0003, ADR 0002, `first-run.md` |
| Fetch latest **published** Release, not `main`; do not pin a version in the Agora skill | ADR 0007 |
| Fetch does **not** pull Agora itself (`Not Agora`) | `fetch-blueprint.md` |
| **Install event** = roster CreateAgent only. Template Add is **not** an install event. First Agora turn / first-run is the registration hook | install-telemetry grill T-R1-Q1 **A**, T-R3-Q2 **A**, ADR 0010 |
| Telemetry URL lives in the skill; `DO_NOT_TRACK` skips; failure never blocks create | T-R1-Q4, ADR 0004 / 0010 |
| Layish owns the template; installing user gets a **fresh** fleet | ADR 0001 |
| Career work is refused in Agora chat | `prompts/out-of-scope.md` |

Do **not** re-grill: install telemetry rounds 1–3, blueprint fetch contract, Euodia v1, steward skill semantics (`first-run` / `need-bot` / `fetch-blueprint`).

---

## Facts (looked up; not user questions)

- **Add copies a recipe**, not Layish’s computer: identity, description/instructions, skills, routines, first-party plugins. Not history, learned memory of the source box, attachments, secrets, custom MCP, or scripts. Recipients still **reconnect** plugins. Source: [Templates for Grok Bot](https://x.ai/bot/guides/templates-for-grok-bot) (Palmer, 8 Sep 2026); `docs/agents/grok-bot-install-facts.md`.
- **Share as Template** does not go live until Publish. Then: **public link** or **team-only**. Official docs do **not** require a gallery listing; the product path is `https://x.ai/bot/…` → review → **Add to Grok Bot** (needs the Grok Bot app).
- **Update template** refreshes the **same** URL for **new** Adds. Already-added copies are not live-pushed (`docs/agents/grok-share-template-update.md` — advisor chat, not an ADR).
- **Personal/private skills** do not copy. Steward skills in this repo must be **first-party / public** on the source bot or they will not arrive on Add.
- Platform docs **do not name** `CreateAgent`. Closest official verbs: create a focused Bot, Duplicate, Add. GitHub reconstruct remains this repo’s invention.
- **This branch vs gaps on `main`:** `bots/agora/` has `profile.md`, `skills/first-run.md`, `need-bot.md`, `fetch-blueprint.md`, `prompts/out-of-scope.md`. `install-telemetry.md` is **not** on `main` (grill locked, implement waited / lives on other work). Euodia `profile.md` **is** on `main`. Fetch-contract implement PR may still be open — this grill does not depend on those skill diffs.

### Language to sharpen later (after answers)

Glossary **installer template** is the Add link. We still need a name for “the frozen recipe bytes” vs `bots/agora/` authorship if Q1/Q4 split gallery copy from `profile.md`. Do **not** invent `export pack` in `CONTEXT.md` until a letter lands.

---

## Design tree (this frontier)

```
thin public Agora template
├── what Add copies (Q1)           → later: exact Grok UI field mapping, export checklist
├── memories in the recipe (Q2)    → later: any curated “setup” memory text
├── first-run trigger (Q3)         → later: routine cron wording if B
├── preview / gallery copy (Q4)    → later: avatar, search keywords
├── visibility (Q5)                → later: gallery SEO if B
├── when to Update template (Q6)   → later: changelog for Adds
├── telemetry bytes in first mint (Q7) → later: baked production URL string
└── plugins in the recipe (Q8)     → later: reconnect copy if not A
```

Not in this round: CreateAgent wiring, child template merchandising (deferred ADR 0004), fetch zipball, `/t` fields, Euodia/Mneme authorship, avatar art, custom domain.

**v1 out of scope** (closed unless you reopen): publishing Euodia/Mneme/Kairos as their own Add links; packing child `bots/<name>/` trees into the Agora recipe as an offline fallback; secrets / custom MCP / scripts; routines that CreateAgent Zetesis→Peitho; Duplicate of Layish’s working box (history, logins, career files).

---

## Round 1

❓ **Q1** - **Which repo files are the Add recipe?**

ADR 0004 already says the public template is thin Agora (persona + create/steward skills), not the fleet. The live tree is `bots/agora/`. Grok Add copies whatever is on the **source bot**, not the GitHub folder automatically — implement will mint from a bot that has these files enabled.

**A.** Recipe = `profile.md` as the bot description/instructions, plus **enabled public skills**: `first-run.md`, `need-bot.md`, `fetch-blueprint.md`. `prompts/out-of-scope.md` is **not** its own Grok skill; it ships only if the template instructions field can include it (paste or “instructions”), otherwise first-run/need-bot keep referencing it and we accept Add may not copy a loose `prompts/` file. README and child `bots/*` are **not** in the recipe.

**B.** Same as **A**, but `prompts/out-of-scope.md` **is** a fourth enabled skill so Add is guaranteed to copy the refusal scripts.

**C.** Ultra-thin bootstrap: `profile.md` + **one** bootstrap skill that fetches `bots/agora/` from latest Release, then runs first-run. Steward skills are **not** frozen in the Add snapshot. (This reopens ADR 0004’s “template ships create/steward skills” as a live git pull of Agora itself; `fetch-blueprint.md` today forbids fetching Agora.)

➡️ **A.** Matches ADR 0004 without a new Agora self-fetch path. Refusal copy already lives in the three skills; a fourth skill is optional polish (pick **B** if you want Add details to list “Out of scope”). **C** is a different product (self-updating installer) and fights the current fetch roster.

---

❓ **Q2** - **Do we ship memories in the template?**

Palmer: templates may include **relevant memories** and drop personal ones. A source Agora that was used for development will have the wrong memories (Layish’s box, leftover `FIRST_RUN` narrative, career chatter).

**A.** **Instructions + skills only.** Strip memories before Publish (or mint from a clean bot that never chatted). No “remembered” roster/telemetry prose in the recipe.

**B.** Allow a **curated** short memory (e.g. “you are the career-fleet installer”) in addition to `profile.md`.

**C.** Don’t care — Publish from the working Agora; platform anonymization is enough.

➡️ **A.** One written persona (`profile.md`). Dev-box memories are how installers inherit the wrong first-run state. **B** duplicates the profile. **C** is how we accidentally ship `/workspace/agora/` gossip.

---

❓ **Q3** - **What triggers first-run after Add?**

`first-run.md` already says: first turn after template Add, or whenever Euodia/Mneme is missing. Template recipes **can** include routines (triggers). The grok.com share chat wanted “wait for explicit stand-up”; that **contradicts** ADR 0003 (foundation on first-run, not a consent gate).

**A.** **No extra routine.** Profile + skill description is the trigger. The user opens Agora and the first model turn runs first-run (any message, including empty/hello). If they never open Agora, foundation does not run — that is acceptable.

**B.** Also attach a **routine** copied by Add, if the UI lets us, whose only job is “on first conversation, run first-run.” Same first-run semantics; routine is a belt.

**C.** **Wait for explicit consent** (“set up Euodia and Mneme”) before CreateAgent. Do not run first-run on hello.

➡️ **A.** Do not reopen ADR 0003. Routines are extra product surface (when they fire, timezone, failure). **C** leaves a user with a silent installer and no Mneme until they guess the passphrase. **B** is fine later if Add-preview shows a routine you actually want listed.

---

❓ **Q4** - **Add-preview / gallery text vs `profile.md`**

Add review shows name, description, skills, integrations. `profile.md` is steward voice (anti-jobs, roster, first-run). A friendlier “career coach” blurb would train people to paste resumes into Agora.

**A.** Preview description **is** `profile.md` (verbatim, or truncated by the UI). Display name **Agora**. No second marketing doc.

**B.** Separate **short** preview blurb (installer for a career fleet; one Add; children are created in-app; not a resume writer). After Add, the bot’s instructions remain `profile.md`.

**C.** Gallery/preview sells **career help** (jobs, resumes, interviews). Steward refusals stay only in skills.

➡️ **A** for v1 (one artefact). If the x.ai short field is too small and truncates mid-anti-job, pick **B** — still **not** **C**. **C** fights `out-of-scope.md` and ADR 0001.

---

❓ **Q5** - **Public share link, gallery listing, or team-only?**

**A.** **Public** `https://x.ai/bot/…` share link. Being in any official **gallery/catalog** is nice-to-have, not a v1 gate. Anyone with the link can Add.

**B.** v1 **requires** a gallery/catalog listing (discoverable without the URL).

**C.** **Team-only** until steward skills freeze; no public Add.

➡️ **A.** The product is the Add link. Gallery placement is merchandising we do not control in this repo. **C** blocks the stated v1 distribution. **B** is a launch checklist item, not a recipe decision.

---

❓ **Q6** - **When do we click Update template?**

Child blueprint edits already ship via **GitHub Release** (ADR 0007) without republishing Agora. The Add snapshot of Agora skills is **frozen** until Update template (new Adds only).

**A.** Update template **only** when shipped `bots/agora/` recipe files change (Q1). Child-only Releases do **not** bump the template.

**B.** Update template on **every** GitHub Release, even if Agora files are unchanged.

**C.** Mint once; **never** Update in v1 (bugs wait for a new link or v2).

➡️ **A.** Matches ADR 0007’s split: blueprints move on Releases; installer recipe moves when Agora’s own files move. **B** is busywork and still does not patch existing Adds. **C** leaves a known-bad first-run in the wild with no same-URL fix for new users.

---

❓ **Q7** - **Does the first published recipe include telemetry client bytes?**

Settled: public URL in skill; `/r` before CreateAgent; `/t` after success; Add is not an install event. `install-telemetry.md` is **not** on `main` yet. `need-bot.md` today: if no URL, skip.

**A.** **Do not mint** the public Add link until telemetry client bytes (URL + `/r`/`/t` + `INSTALL_ID`) are in the recipe. Early Adds would never register.

**B.** Mint **without** telemetry bytes. First-run/need skip `/r`/`/t` until a later **Update template** (or until implement lands). Early Adds are invisible to the meter (counts already **untrusted** until rate-limit).

**C.** Recipe never contains telemetry. First-run **fetches** a telemetry skill from GitHub (Agora self-fetch — not allowed by current `fetch-blueprint.md`).

➡️ **B.** Unblocks the Add link; meter was never the install vehicle. Pick **A** if you want user #1 in Blob. **C** is Q1-**C** again.

---

❓ **Q8** - **First-party plugins in the v1 recipe?**

Add copies plugin *slots*; the recipient **reconnects**. Fetch is **anonymous HTTPS** to GitHub (fetch grill F-R1-Q3 **A**). Palmer’s example shipped GitHub + Cursor because that bot used them.

**A.** **No plugins** in the v1 Agora template. Zipball over HTTPS from the Grok computer. No GitHub/Cursor/MCP reconnect step on Add.

**B.** Include **GitHub** (reconnect) so fetch can use `gh` / authenticated API.

**C.** Include GitHub **and** Cursor (or other first-party slots we use while authoring).

➡️ **A.** Auth-gated GitHub was rejected for fetch. Extra plugins show up on Add review and look like a Cursor-dev bot. Reconnect friction is not the installer job.

---

## After this round (do not answer now)

- Exact mint procedure (clean bot vs Update from files).
- Avatar, emoji, Greek in the **display name** field vs profile heading.
- Whether out-of-scope paste fits the instructions character limit (if Q1 **A**).
- Production telemetry host string (if Q7 **A**).
- Routine text (if Q3 **B**).
- Gallery SEO (if Q5 **B**).

---

## Glossary / ADR after close

When round 1 is answered: if Q1/Q4 introduce a preview blurb distinct from `profile.md`, add a glossary term (installer recipe vs authorship tree). Offer a short ADR only if Q1 **C** (Agora self-fetch) or Q3 **C** (consent gate) — those reopen 0004 / 0003. **A** answers probably need **no** new ADR.

Do **not** write those ADRs in this PR. Do **not** implement.
