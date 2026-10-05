# 04 — Tailor + G4 stop (Kairos)

**Bot:** Kairos (`skills/tailor-resume.md` + `frameworks/` + `templates/`).

## Read

jd-bank entry + masters (`profile.yaml`, `preferences.yaml`, `master-resume.md`). Honor preference hints without inventing facts.

## Kairos does

1. Strategy from disclosed tailor-rules (3 keywords, core narrative, reorder/compress) using jd-bank must/nice/hidden.
2. Write `/workspace/agora/applications/resume_helios-data_staff-platform-engineer.md` (one honest job-specific resume; no fabricate; no verb inflation).
3. Write matching `.html` loader by copying `bots/kairos/templates/resume-loader.html` and setting `RESUME_MD` to the sibling md filename.
4. Write sibling `/workspace/agora/applications/resume_helios-data_staff-platform-engineer.diff.md` (strategy + change blocks + compressed/omitted + honest gaps). **Not** inside the resume body.
5. Tell user: paths written (md, html, diff); **fleet never applies**; Melete after apply-commit via user or Euodia.
6. DM Euodia: tailor complete / awaiting apply (pointer).
7. **Do not** DM Melete (G4).
8. **Do not** mutate masters or story-bank.

## Expected artifacts (assert)

```
/workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
/workspace/agora/applications/resume_helios-data_staff-platform-engineer.html
/workspace/agora/applications/resume_helios-data_staff-platform-engineer.diff.md
```

HTML contains a `RESUME_MD` (or equivalent) pointing at the sibling `.md`. Diff has frontmatter paths + at least one `### Change` block when material edits exist.

## Expected DM

```
from: Kairos
to: Euodia
type: pointer
payload:
  stage: tailor
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
  status: awaiting_apply
```

## Forbidden

```
from: Kairos
to: Melete
# MUST NOT appear on tailor complete
```

## Pass hooks

- Applications sole-written by Kairos (md + html + diff).
- Checklist section **I** (hard FAIL if md/html/diff missing, masters mutate, or G4 fails).
- No Melete DM.
- No apply / CreateAgent / master mutation.
- Live tailor quality remains manual acceptance.
