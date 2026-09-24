# ADR 0007 — Fetch the latest GitHub Release, don’t pin a version in the Agora skill

CreateAgent needs a snapshot of blueprints, not live `main`. Pinning a version inside Agora’s skill would freeze every installer until we republish Agora. Layish wants Agora to pull GitHub’s **latest Release**, record which release was used, and later an upgrade skill can notice a newer release. Bump a Release when blueprints change; do not float on `main`.
