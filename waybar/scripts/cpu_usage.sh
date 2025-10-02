#!/usr/bin/env bash
set -eE -o pipefail
on_error() {
  printf '{"text":"N/A","tooltip":"CPU data unavailable","class":"normal"}\n'
  exit 0
}
trap on_error ERR
json_escape() {
  local s
  s=$(printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/\"/\\\"/g' -e ':a;N;$!ba;s/\n/\\n/g')
  printf '%s' "$s"
}
read_cpu_total() {
  awk '/^cpu\s/ { print $2, $3, $4, $5, $6, $7, $8, $9, $10, $11 }' /proc/stat
}
read_percpu_snapshot() {
  awk '/^cpu[0-9]+\s/ { idle=$5; total=0; for (i=2;i<=NF;i++) total+=$i; printf "%s %d %d\n", $1, total, idle }' /proc/stat
}
cpu_a=($(read_cpu_total))
sleep 0.25
cpu_b=($(read_cpu_total))
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
if [ "$usage" -lt 0 ]; then usage=0; fi
if [ "$usage" -gt 100 ]; then usage=100; fi
class="normal"
if read -r la1 la5 la15 rest < /proc/loadavg 2>/dev/null; then
  tooltip=$(printf "CPU usage: %d%%\nLoad avg: %s %s %s" "$usage" "$la1" "$la5" "$la15")
else
  tooltip=$(printf "CPU usage: %d%%" "$usage")
fi
text=$(printf "%d%%" "$usage")
escaped_text=$(json_escape "$text")
escaped_tooltip=$(json_escape "$tooltip")
printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$escaped_text" "$escaped_tooltip" "$class"