# Master Resume — Comprehensive Structured Fields (story / evidence)

Contact and wants live in `profile.yaml` and `preferences.yaml`. This file is **story only**.
No page limit. Echo for confirmation. `[missing]` / `[to confirm]` as needed.

**No standalone skills list.** Skills live inside tagged bullets. See `guides/writing-tips.md`.

```
# ---- Experience (every role, not just recent/relevant ones) ----
experience:
  - company:
    role:
    location:    # optional
    start:       # YYYY-MM
    end:         # YYYY-MM or Present
    context:     # optional: team size, what the company/product does
    bullets:
      - text:
        tags:    # 0-N [Tag] labels
        variants: # optional alternate phrasings
          -

# ---- Projects ----
projects:
  - name:
    role:
    link:
    date:
    context:
    bullets:
      - text:
        tags:

# ---- Education ----
education:
  - school:
    degree:
    location:
    start:
    end:
    detail:      # GPA / honors
    bullets:     # coursework, capstone — tagged
      - text:
        tags:

# ---- Certifications ----
certifications:
  - name:
    issuer:
    date:
    note:
    tags:

# ---- Additional (include whatever applies) ----
awards:
languages:
publications:
volunteer:
speaking:
other:
```

## Judgment Calls

- Completeness, not curation — Kairos curates for a job.
- No bare skill words — bullet + tag, or interest in preferences `career_notes`.
- Reverse-chronological within each section.
- Multiple phrasings → `variants`.
- Numbers verified on echo-back.
- Tag every skill-bearing bullet per `guides/writing-tips.md`.
