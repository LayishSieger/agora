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
# Delimiter is # so paths may contain :
while IFS='#' read -r dir label; do
  if [[ -d "$ROOT/$dir" ]] && compgen -G "$ROOT/$dir/*" > /dev/null; then
    echo "PASS  populated: $label ($dir/)"
    pass=$((pass + 1))
  else
    echo "INFO  empty/absent: $label ($dir/) — OK if scenario stopped early"
  fi
done <<'EOF'
jobs#Zetesis jobs
jd-bank#Hermeneia jd-bank
applications#Kairos applications
offer-bank#Peitho offer-bank
deal-bank#Peitho deal-bank
EOF

if [[ -n "$DM_LOG" && -f "$DM_LOG" ]]; then
  echo ""
  echo "== DM log pointer checks ($DM_LOG) =="
  if grep -qE 'type:[[:space:]]*pointer' "$DM_LOG"; then
    echo "PASS  pointer DMs present"
    pass=$((pass + 1))
  else
    echo "FAIL  no type: pointer entries found"
    fail=$((fail + 1))
  fi

  # J7: when jobs/ is populated, require a Zetesis→Euodia pointer DM block
  if [[ -d "$ROOT/jobs" ]] && compgen -G "$ROOT/jobs/*" > /dev/null; then
    if awk '
      BEGIN { in_block=0; from_z=0; to_e=0; found=0 }
      /^```/ {
        if (in_block && from_z && to_e) found=1
        in_block = !in_block
        from_z=0; to_e=0
        next
      }
      in_block && /^from:[[:space:]]*Zetesis[[:space:]]*$/ { from_z=1 }
      in_block && from_z && /^to:[[:space:]]*Euodia[[:space:]]*$/ { to_e=1 }
      END { if (in_block && from_z && to_e) found=1; exit found ? 0 : 1 }
    ' "$DM_LOG"; then
      echo "PASS  Zetesis→Euodia pointer DM present (J7)"
      pass=$((pass + 1))
    else
      echo "FAIL  jobs/ populated but no Zetesis→Euodia pointer DM (J7)"
      fail=$((fail + 1))
    fi
  else
    echo "INFO  jobs/ empty — skip J7 Euodia-after-hunt check"
  fi

  # G4: fail only if a fenced/code DM block has from:Kairos then to:Melete
  # (ignore prose comments and section headers)
  if awk '
    BEGIN { in_block=0; from_kairos=0; to_melete=0; viol=0 }
    /^```/ {
      if (in_block && from_kairos && to_melete) viol=1
      in_block = !in_block
      from_kairos=0; to_melete=0
      next
    }
    in_block && /^from:[[:space:]]*Kairos[[:space:]]*$/ { from_kairos=1 }
    in_block && from_kairos && /^to:[[:space:]]*Melete[[:space:]]*$/ { to_melete=1 }
    END { if (in_block && from_kairos && to_melete) viol=1; exit viol ? 0 : 1 }
  ' "$DM_LOG"; then
    echo "FAIL  Kairos→Melete pointer DM block found (G4)"
    fail=$((fail + 1))
  else
    echo "PASS  no Kairos→Melete DM block (G4 hard stop held)"
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
  echo "INFO  no dm-log provided — skip pointer/G4/J7 heuristics"
fi

echo ""
echo "Result: $pass pass, $fail fail"
[[ "$fail" -eq 0 ]]
