# Tailor diff schema — Kairos

Disclosed framework. Read when writing the sibling changelog.

**Path:** `/workspace/agora/applications/resume_<company>_<role>.diff.md`  
Same stem as the tailored resume. **Not** embedded inside the resume body (R3-Q3).

English only. No third-party branding.

---

## Purpose

Show what changed from the master story and why — so the user can learn the edit and verify no fabrication.

---

## Required shape

### Frontmatter

```yaml
---
company: "Helios Data"
role: "Staff Platform Engineer"
resume_path: "/workspace/agora/applications/resume_helios-data_staff-platform-engineer.md"
jd_bank_path: "/workspace/agora/jd-bank/helios-data-staff-platform.md"
master_path: "/workspace/agora/master-resume.md"
updated: "YYYY-MM-DD"
---
```

### Body

1. **Strategy** (short) — 3 keywords, 1 core narrative, reorder/compress notes.
2. **Changes** — one block per edit (every material rewrite). Omit noise-only whitespace.

Each change block:

```markdown
### Change N — <short label>

**Original (master):**
> <exact or clearly quoted master text>

**Tailored:**
> <new text as written in the resume>

**Aligned to JD:**
- <Must-have / Nice-to-have / Hidden signal> — <brief>
- Keywords: "…", "…"

**Evidence:** <which master bullet / field supplies the fact — confirms no fabricate>
```

3. **Compressed / omitted** — list experience left out or reduced to one line, with reason (de_emphasize or weak JD fit).
4. **Gaps left honest** — Must-haves not covered by masters (do not invent coverage).

---

## Rules

- One change block per material edit. If you rewrote five bullets, write five blocks.
- Diff is a sibling file under `applications/` — Kairos sole-writes it with the md + html.
- Never put the changelog inside `resume_*.md`.
- Never claim evidence that is not on masters.
