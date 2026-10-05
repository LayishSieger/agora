# jd-bank schema — Hermeneia

Minimal durable shape for `/workspace/agora/jd-bank/<slug>.md`. Markdown only. No polished multi-section HTML report pack.

Hermeneia sole-writes. Optional `/workspace/agora/jd-bank/_index.md` may aggregate rows.

---

## Frontmatter (required)

```yaml
---
company: "<Company>"
role: "<Role title>"
level: "<as stated or inferred; or unknown>"
source: "<url or paste|jobs-path|pointer-id>"
source_url: "<url if any>"
decoded_at: "<YYYY-MM-DD>"
updated: "<YYYY-MM-DD>"
status: "decoded"   # decoded | matched | forwarded | stopped | unscored
match_percent: 85   # integer gate point — omit or null when unscored
match_range: "80-88"  # optional display only
verdict_band: "forward"  # stop | ask | forward | unscored
gaps: ["…"]         # short list; detail in body
masters_used: true  # false when unscored
tags: []
---
```

When masters are thin/missing: set `status: unscored`, `verdict_band: unscored`, omit `match_percent` (or set null), `masters_used: false`.

---

## Body sections (required)

Use these headings (exact enough for checklist H):

1. `## Requirements` — HM translation; 3–5 evidence-labeled bullets
2. `## Must-haves` — 3–5 bullets
3. `## Nice-to-haves` — 3–5 bullets
4. `## Hidden signals` — 3–5 bullets or compact table
5. `## Level / team / stage` — 3–5 bullets
6. `## Match` — gate point + optional range + Must/Nice/Hidden breakdown (or “unscored — masters missing”)
7. `## Gaps and risks` — tiered gaps (fixable / hard); risks separate; skip Skip-tier noise
8. `## Go / no-go` — band action vs M=70 / N=80 + one-line reason

Optional: collapsed raw JD under a details block. Do not invent missing JD text.

---

## Filename

`<company-slug>-<role-slug>.md` — e.g. `helios-data-staff-platform.md`.

---

## Optional index

`_index.md` rows: company, role, path, match_percent or unscored, verdict_band, updated. Keep short. Update when writing or reusing an entry.
