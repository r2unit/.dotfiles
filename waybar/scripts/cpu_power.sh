#!/usr/bin/env bash

# Get CPU frequency (average across all cores in GHz)
freq_khz=$(awk '{s+=$0; n++} END {if(n>0) print int(s/n)}' /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq 2>/dev/null)
if [ -n "$freq_khz" ]; then
    freq_ghz=$(awk "BEGIN {printf \"%.2f\", $freq_khz/1000000}")
else
    freq_ghz="0.00"
fi

# Get CPU power consumption
power=""

# Try to read power from various sources
for path in /sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj \
            /sys/class/hwmon/hwmon*/power*_input \
            /sys/class/power_supply/BAT*/current_now; do
    if [ -r "$path" ] 2>/dev/null; then
        val=$(cat "$path" 2>/dev/null)
        if [ -n "$val" ] && [ "$val" -gt 0 ] 2>/dev/null; then
            # Convert microwatts to watts
            power=$(awk "BEGIN {printf \"%.1f\", $val/1000000}")
            break
        fi
    fi
done

# Output format
if [ -n "$power" ] && [ "$power" != "0.0" ]; then
    echo "{\"text\": \"${freq_ghz}GHz ${power}W\", \"tooltip\": \"CPU: ${freq_ghz}GHz\\nPower: ${power}W\"}"
else
    echo "{\"text\": \"${freq_ghz}GHz\", \"tooltip\": \"CPU Frequency: ${freq_ghz}GHz\"}"
fi
