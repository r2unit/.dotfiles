#!/usr/bin/env bash
# Lightweight CPU usage monitor for Waybar custom module
# Outputs JSON with: text, tooltip, class
# - Samples /proc/stat twice (short interval) to compute utilization
# - Tooltip shows per-core/thread usage breakdown on hover
# - Adds class: normal|warning|critical (reserved for future styling)

set -eE -o pipefail
on_error() {
  printf '{"text":"N/A","tooltip":"CPU data unavailable","class":"normal"}\n'
  exit 0
}
trap on_error ERR

# JSON escape helper (escape backslash, quotes, and newlines)
json_escape() {
  local s
  s=$(printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/\"/\\\"/g' -e ':a;N;$!ba;s/\n/\\n/g')
  printf '%s' "$s"
}

# Overall CPU sample from /proc/stat
read_cpu_total() {
  awk '/^cpu\s/ { print $2, $3, $4, $5, $6, $7, $8, $9, $10, $11 }' /proc/stat
}

# Per-CPU snapshot: prints lines "cpuN total idle"
read_percpu_snapshot() {
  awk '/^cpu[0-9]+\s/ { idle=$5; total=0; for (i=2;i<=NF;i++) total+=$i; printf "%s %d %d\n", $1, total, idle }' /proc/stat
}

# First snapshot
cpu_a=($(read_cpu_total))

# Short sleep to measure deltas
sleep 0.25

# Second snapshot
cpu_b=($(read_cpu_total))

# Sum all fields for total time
sum() { local s=0; for v in "$@"; do s=$((s + v)); done; echo "$s"; }

total_a=$(sum "${cpu_a[@]}")
idle_a=${cpu_a[3]}

total_b=$(sum "${cpu_b[@]}")
idle_b=${cpu_b[3]}

delta_total=$(( total_b - total_a ))
delta_idle=$(( idle_b - idle_a ))

usage=0
if [ "$delta_total" -gt 0 ]; then
  usage=$(( (100 * (delta_total - delta_idle)) / delta_total ))
fi

# Clamp
if [ "$usage" -lt 0 ]; then usage=0; fi
if [ "$usage" -gt 100 ]; then usage=100; fi

class="normal"

# Build tooltip with load average and per-core breakdown
if read -r la1 la5 la15 rest < /proc/loadavg 2>/dev/null; then
  tooltip=$(printf "CPU usage: %d%%\nLoad avg: %s %s %s" "$usage" "$la1" "$la5" "$la15")
else
  tooltip=$(printf "CPU usage: %d%%" "$usage")
fi


text=$(printf "%d%%" "$usage")

escaped_text=$(json_escape "$text")
escaped_tooltip=$(json_escape "$tooltip")

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$escaped_text" "$escaped_tooltip" "$class"
