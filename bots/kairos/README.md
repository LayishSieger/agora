# Kairos blueprint

Resume Tailor. One job: write `/workspace/agora/applications/resume_<company>_<role>.md` plus a thin HTML loader from the shared template and a sibling `.diff.md`. No auto-forward to Melete (G4).

| Path | Purpose |
|---|---|
| `profile.md` | CreateAgent description (compact job blurb) |
| `skills/tailor-resume.md` | Tailor + applications md/html/diff + hard stop |
| `frameworks/tailor-rules.md` | Disclosed honest-rewrite rules + preference hints |
| `frameworks/diff-schema.md` | Sibling tailor-diff changelog shape |
| `templates/resume-loader.html` | Shared HTML loader (copy per job; loads sibling md) |
| `prompts/out-of-scope.md` | Refusal scripts |

Sole-writes: `applications/resume_<company>_<role>.md`, `.html`, and `.diff.md`. Does not write masters, journey, jobs, jd-bank, offer/deal banks. One skill + disclosed frameworks + one template — not a twelve-template pack.
