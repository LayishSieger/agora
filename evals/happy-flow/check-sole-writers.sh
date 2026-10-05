#!/usr/bin/env bash
# check-sole-writers.sh — minimal post-sim invariant check
# Usage: ./check-sole-writers.sh <agora-root> [dm-log.md]
set -euo pipefail

ROOT="${1:-}"
DM_LOG="${2:-}"

if [[ -z "$ROOT" || ! -d "$ROOT" ]]; then
  echo "usage: $0 <agora-root> [dm-log.md]" >&2
  exit 2
fi

fail=0
pass=0

check_exists() {
  local path="$1"
  local label="$2"
  if [[ -e "$ROOT/$path" ]]; then
    echo "PASS  exists: $label ($path)"
    pass=$((pass + 1))
  else
    echo "FAIL  missing: $label ($path)"
    fail=$((fail + 1))
  fi
}

echo "== Sole-writer path presence under $ROOT =="
check_exists "profile.yaml" "Mneme master"
check_exists "preferences.yaml" "Mneme master"
check_exists "master-resume.md" "Mneme master"
check_exists "story-bank.md" "Mneme story-bank"
check_exists "journey.md" "Euodia journey"

# Stage outputs optional depending on how far the sim got
for pair in \
  "jobs|:Zetesis jobs" \
  "jd-bank|:Hermeneia jd-bank" \
  "applications|:Kairos applications" \
  "offer-bank|:Peitho offer-bank" \
  "deal-bank|:Peitho deal-bank"
do
  dir="${pair%%:*}"
  label="${pair##*:}"
  if [[ -d "$ROOT/$dir" ]] && compgen -G "$ROOT/$dir/*" > /dev/null; then
    echo "PASS  populated: $label ($dir/)"
    pass=$((pass + 1))
  else
    echo "INFO  empty/absent: $label ($dir/) — OK if scenario stopped early"
  fi
done

if [[ -n "$DM_LOG" && -f "$DM_LOG" ]]; then
  echo ""
  echo "== DM log pointer checks ($DM_LOG) =="
  if grep -qE 'type:\s*pointer' "$DM_LOG"; then
    echo "PASS  pointer DMs present"
    pass=$((pass + 1))
  else
    echo "FAIL  no type: pointer entries found"
    fail=$((fail + 1))
  fi
  # Full-body smells (heuristic)
  if grep -qiE '^(from:.*\n)?to:.*\n.*\b(requirements:|salary components:|full jd)\b' "$DM_LOG"; then
    echo "WARN  possible full-body content in DM log — review manually"
  fi
  if grep -qiE 'from:\s*Kairos' "$DM_LOG" && grep -A2 -iE 'from:\s*Kairos' "$DM_LOG" | grep -qiE 'to:\s*Melete'; then
    # Check if any Kairos→Melete block exists without awaiting/engage context — hard fail if tailor-complete auto
    if grep -B5 -A10 -iE 'from:\s*Kairos' "$DM_LOG" | grep -qiE 'to:\s*Melete' && \
       ! grep -B5 -A10 -iE 'from:\s*Kairos' "$DM_LOG" | grep -qiE 'post_apply|after_apply|engage'; then
      echo "FAIL  Kairos→Melete DM looks like auto-forward (G4)"
      fail=$((fail + 1))
    else
      echo "PASS  no clear G4-violating Kairos→Melete auto DM"
      pass=$((pass + 1))
    fi
  else
    echo "PASS  no Kairos→Melete DM (G4 hard stop held)"
    pass=$((pass + 1))
  fi
  if grep -qiE 'CreateAgent|i applied for you|submitted (the )?application' "$DM_LOG"; then
    echo "FAIL  DM log mentions CreateAgent or fleet apply"
    fail=$((fail + 1))
  else
    echo "PASS  no CreateAgent / fleet-apply language in DM log"
    pass=$((pass + 1))
  fi
else
  echo ""
  echo "INFO  no dm-log provided — skip pointer/G4 heuristics"
fi

echo ""
echo "Result: $pass pass, $fail fail"
[[ "$fail" -eq 0 ]]
