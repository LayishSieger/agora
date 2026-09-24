# Grill — Author Agora steward skills

Skill bodies still wait except as noted below.

**Settled**

- v1: Add Agora only; CreateAgent children from GitHub (ADR 0006).
- Fetch **latest GitHub Release**, remember which; later upgrade skill can check for newer (ADR 0007). Not `main`.
- First-run **behavior**: first message, if foundation missing, create then greet (Q2 A).
- **Do not write `first-run.md` until Euodia is grilled** (Q3 B). Then it still creates both.
- Blueprint = whole `bots/<name>/` (Q4 A).

---

## Round 4 — last mechanics (short)

❓ **Q1** - **Where do fetched files go on the computer?**

- **A.** `/workspace/blueprints/<name>/`
- **B.** `/workspace/agora/blueprints/<name>/` (next to career files)
- **C.** Temp folder, delete after CreateAgent

➡️ **Recommend A.** Keep `/workspace/agora/` for Mneme/Kairos career files only.

---

❓ **Q2** - **After fetch, how does the child get its brain?**

- **A.** CreateAgent using `profile.md` as the description; leave the folder on disk; save each `skills/*.md` as a skill on that bot
- **B.** Put everything into the Bot description only
- **C.** Files on disk only; no Grok skills

➡️ **Recommend A.**

---

❓ **Q3** - **`need <Name>`**

- **A.** Only the seven roster names. Already exists → return that bot, don’t create a second. Unknown name → refuse.
- **B.** Also accept Greek / English titles as aliases
- **C.** Any name

➡️ **Recommend A.**

---

❓ **Q4** - **Write skills now?**

- **A.** Write `fetch-blueprint.md` + `need-bot.md` now (Mneme is enough to test need). `first-run.md` after Euodia.
- **B.** Write nothing until Euodia is also grilled.

➡️ **Recommend A** so Agora can `need Mneme` / later stages from files. first-run stays a reminder in the plan.

---

Reply like `Q1 A, Q2 A, Q3 A, Q4 A`.
