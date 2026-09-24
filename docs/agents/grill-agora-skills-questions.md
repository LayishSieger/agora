# Grill — Author Agora steward skills

Skill bodies are **not** written until this grill is settled or you say proceed.

**Settled:** v1 user Adds **Agora only**. Agora **CreateAgent**s children from this GitHub repo. Not independent child templates — they are one flow (ADR 0006). Round 2 Q2–Q4 skipped.

**Still true:** only Agora CreateAgent; first-run aims at Euodia + Mneme; later bots via `need <Name>`; Mneme grilled; Euodia stub; telemetry hosting later.

---

## Round 3 — keep it short

❓ **Q1** - **Which GitHub version does Agora fetch?**

- **A.** Latest GitHub Release
- **B.** A tag pinned in the Agora skill (bump pin + Update template when you want)
- **C.** Live `main`

➡️ **Recommend B** (stable). **A** if you want blueprint fixes without touching Agora. Don’t pick **C**.

---

❓ **Q2** - **When does first-run create Euodia + Mneme?**

- **A.** On the first message, if they’re missing — then greet once
- **B.** Only after the user says yes (“stand up the foundation”)

➡️ **Recommend A** (matches the existing first-run story). **B** is what that Grok chat suggested.

---

❓ **Q3** - **Euodia is still a stub. First-run?**

- **A.** Create both anyway (stub Euodia until its grill)
- **B.** Don’t write `first-run` until Euodia is grilled
- **C.** Create Mneme only for now (changes “both on first-run”)

➡️ **Recommend A** if a stub pathfinder is ok; **B** if not. Don’t silently pick **C**.

---

❓ **Q4** - **What files is a “blueprint”?**

- **A.** Whole `bots/<name>/` (profile, skills, prompts, guides, schemas)
- **B.** Only `profile.md` + `skills/*.md`

➡️ **Recommend A.** Mneme’s skill already points at prompts/guides/schemas.

---

Reply A/B/C for Q1–Q4. Then we can finish the last bits (where files land, how skills attach) or you can say proceed to write the three skills.
