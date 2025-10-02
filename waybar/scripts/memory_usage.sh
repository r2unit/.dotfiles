#!/usr/bin/env bash
set -euo pipefail
json_escape() {
  local s
  s=$(printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/\"/\\\"/g' -e ':a;N;$!ba;s/\n/\\n/g')
  printf '%s' "$s"
}
mem_total_kb=$(awk '/^MemTotal:/ {print $2}' /proc/meminfo)
mem_avail_kb=$(awk '/^MemAvailable:/ {print $2}' /proc/meminfo)
if [[ -z "${mem_avail_kb:-}" || "${mem_avail_kb}" = "0" ]]; then
  mem_avail_kb=$(awk '
    /^MemFree:/ {free=$2}
    /^Buffers:/ {buf=$2}
    /^Cached:/ {cache=$2}
    END {print free+buf+cache}
  ' /proc/meminfo)
fi
used_kb=$(( mem_total_kb - mem_avail_kb ))
if (( used_kb < 0 )); then used_kb=0; fi
used_gib=$(awk -v kb="$used_kb" 'BEGIN { printf "%.0f", kb/1048576 }')
total_gib=$(awk -v kb="$mem_total_kb" 'BEGIN { printf "%.0f", kb/1048576 }')
used_gib_dec=$(awk -v kb="$used_kb" 'BEGIN { printf "%.1f", kb/1048576 }')
total_gib_dec=$(awk -v kb="$mem_total_kb" 'BEGIN { printf "%.1f", kb/1048576 }')
percent=0
if (( mem_total_kb > 0 )); then
  percent=$(( (used_kb * 100) / mem_total_kb ))
fi
text="${used_gib}/${total_gib} GiB"
tooltip=$(printf "Memory used: %s GiB / %s GiB (%d%%)" "$used_gib_dec" "$total_gib_dec" "$percent")
escaped_text=$(json_escape "$text")
escaped_tooltip=$(json_escape "$tooltip")
printf '{"text":"%s","tooltip":"%s"}\n' "$escaped_text" "$escaped_tooltip"