#!/usr/bin/env bash

# Kill any existing waybar instances
killall waybar 2>/dev/null

# Wait for them to die
while pgrep -x waybar >/dev/null; do sleep 0.1; done

# Launch waybar with custom config
waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css &
