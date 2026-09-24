# Master resume — live file shape

Live path: `/workspace/agora/master-resume.md` (YAML document; `.md` suffix is workspace convention).

Contact and wants live in `profile.yaml` and `preferences.yaml`. This file is **story only**.
No page limit. Echo for confirmation. `[missing]` / `[to confirm]` as needed.

**No standalone skills list.** Skills live inside tagged bullets. See `guides/writing-tips.md`.

Required top-level keys: `variant` (must be `master`), `updated` (YYYY-MM-DD), plus the section keys below (use `[]` if none).

Do **not** add: `contact`, `email`, `target_roles`, `objective`, `summary`, `company` (as a target), `jd`, `fit`.

```yaml
variant: master
updated: YYYY-MM-DD

# ---- Experience (every role, not just recent/relevant ones) ----
experience:
  - company: ""
    role: ""
    location: ""     # optional; omit if unused
    start: ""        # YYYY-MM
    end: ""          # YYYY-MM or Present
    context: ""      # optional: team size, what the company/product does
    bullets:
      - text: ""
        tags: []     # 0-N strings, e.g. "Microsoft Excel (XLOOKUP, PivotTables)"
        variants:    # optional; each item is alternate wording of the SAME facts
          - text: ""
            # forbidden keys: audience, company, jd, role_target

# ---- Projects ----
projects:
  - name: ""
    role: ""
    link: ""
    date: ""
    context: ""
    bullets:
      - text: ""
        tags: []

# ---- Education ----
education:
  - school: ""
    degree: ""
    location: ""
    start: ""
    end: ""
    detail: ""       # GPA / honors
    bullets:         # coursework, capstone — tagged
      - text: ""
        tags: []

# ---- Certifications ----
certifications:
  - name: ""
    issuer: ""
    date: ""
    note: ""
    tags: []

# ---- Additional (include whatever applies; [] if none) ----
awards: []
languages: []
publications: []
volunteer: []
speaking: []
other: []            # overflow evidence that is still the candidate's story
```

## Judgment Calls

- Completeness, not curation — Kairos curates for a job. Mneme never writes `applications/`.
- No bare skill words — bullet + tag, or interest in preferences `career_notes`.
- Reverse-chronological within each section.
- Multiple phrasings → `variants` (same facts only).
- Numbers verified on echo-back.
- Tag every skill-bearing bullet per `guides/writing-tips.md`.
- Re-import merges by union; conflicts on company/role/dates → ask.
- English only.
