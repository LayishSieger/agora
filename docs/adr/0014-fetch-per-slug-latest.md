# ADR 0014 — Each fetch resolves latest on its own; mixed tags are allowed

First-run calls blueprint fetch for Agora (disk playbooks), then Euodia, then Mneme. Forcing those onto one tag would fail a later slug if `/releases/latest` moved mid-turn, or would pin an in-flight snapshot after we already forbade restore (ADR 0007). Each fetch resolves latest independently. Installed blueprints on one computer may record different `RELEASE` tags. `FIRST_RUN`’s single `tag=` line is a marker detail, not a shared snapshot.
