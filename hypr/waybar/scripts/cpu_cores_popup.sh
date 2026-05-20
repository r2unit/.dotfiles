#!/usr/bin/env bash

# build per-core frequency list
lines=""
for path in /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq; do
    core=$(echo "$path" | grep -o 'cpu[0-9]*' | grep -o '[0-9]*')
    khz=$(cat "$path" 2>/dev/null)
    if [ -n "$khz" ]; then
        mhz=$(awk "BEGIN {printf \"%4d\", $khz/1000}")
        lines="${lines}CORE ${core}   ${mhz} MHz\n"
    fi
done

printf "%b" "$lines" | rofi -dmenu \
    -p "CPU CORES" \
    -no-custom \
    -no-click-to-exit \
    -theme-str '
        window {
            background-color: #000000;
            border: 1px solid #ffffff;
            border-radius: 0;
            width: 220px;
        }
        mainbox {
            background-color: transparent;
            spacing: 0;
        }
        inputbar {
            background-color: #000000;
            text-color: #ffffff;
            border: 0 0 1px 0;
            border-color: rgba(255,255,255,0.3);
            padding: 4px 8px;
            font: "JetBrains Mono 9";
            children: [prompt, entry];
        }
        prompt {
            background-color: transparent;
            text-color: #ffffff;
            font: "JetBrains Mono Bold 9";
            enabled: true;
        }
        entry {
            background-color: transparent;
            text-color: #ffffff;
            font: "JetBrains Mono 9";
            placeholder: "";
            placeholder-color: transparent;
        }
        listview {
            background-color: transparent;
            lines: 8;
            padding: 2px 0;
            fixed-height: true;
            scrollbar: false;
        }
        element {
            background-color: transparent;
            text-color: rgba(255,255,255,0.75);
            padding: 3px 10px;
            border-radius: 0;
            font: "JetBrains Mono 9";
        }
        element selected {
            background-color: rgba(255,255,255,0.08);
            text-color: #ffffff;
        }
    '
