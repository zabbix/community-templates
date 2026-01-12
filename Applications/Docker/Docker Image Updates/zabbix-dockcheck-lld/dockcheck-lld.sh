#!/bin/bash
set -euo pipefail

# path to your dockcheck.sh installation from https://github.com/mag37/dockcheck
DOCKCHECK="/etc/zabbix/scripts/dockcheck.sh"

# path to cache that will be used
CACHE_FILE="/tmp/dockcheck_cache.txt"
CACHE_AGE=540  # 9 minutes

# Cache logic
if [[ ! -f "$CACHE_FILE" ]] || [[ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0))) -gt $CACHE_AGE ]]; then
    OUT="$("$DOCKCHECK" -n 2>/dev/null || true)"
    
    # Normalize output (remove ANSI colors + CR)
    CLEAN="$(printf "%s\n" "$OUT" \
      | sed -r 's/\x1B\[[0-9;]*[A-Za-z]//g' \
      | sed 's/\r$//')"

   # Parse containers
   # Output format: name<TAB>status
   # status: 0=latest, 1=update
    PARSED="$(printf "%s\n" "$CLEAN" | awk '
      function set_status(name, code,   r) {
        if (name == "") return
        r = (code == 1 ? 2 : 1)
        if (!(name in rank) || r > rank[name]) {
          rank[name] = r
          status[name] = code
        }
      }
      BEGIN { sec="" }
      /^[[:space:]]*Containers on latest version:/          { sec="latest"; next }
      /^[[:space:]]*Containers with updates available:/     { sec="updates"; next }
      sec != "" && $0 ~ /^[[:space:]]*$/ { sec=""; next }
      sec == "latest" {
        if ($0 ~ /^!/) next
        if ($0 ~ /^[A-Za-z0-9_.-]+$/) set_status($0, 0)
      }
      sec == "updates" {
        if ($0 ~ /^[A-Za-z0-9_.-]+$/) set_status($0, 1)
      }
      END {
        for (n in status) print n "\t" status[n]
      }
    ' | sort )"
    
    printf "%s\n" "$PARSED" > "$CACHE_FILE"
fi

PARSED="$(cat "$CACHE_FILE")"

mode="${1:-}"
name="${2:-}"

# ---- Status mode ----
if [[ "$mode" == "status" ]]; then
  if [[ -z "$name" ]]; then
    echo 0
    exit 0
  fi
  code="$(printf "%s\n" "$PARSED" \
    | awk -F'\t' -v n="$name" '$1==n {print $2; found=1} END{ if(!found) print 0 }')"
  echo "$code"
  exit 0
fi

# ---- LLD JSON mode ----
printf '{"data":['
first=1
while IFS=$'\t' read -r cname ccode; do
  [[ -z "$cname" ]] && continue
  [[ $first -eq 0 ]] && printf ','
  first=0
  esc="$(printf '%s' "$cname" | sed 's/\\/\\\\/g; s/"/\\"/g')"
  printf '{"{#CONTAINER}":"%s"}' "$esc"
done <<< "$PARSED"
printf ']}\n'
