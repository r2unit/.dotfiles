#!/bin/bash
# Focus the nth window on current workspace (counting left to right, top to bottom)

WINDOW_INDEX=$1

# Get current workspace
WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')

# Get all windows on current workspace, sorted by position (x coordinate, then y)
WINDOWS=$(hyprctl clients -j | jq -r --arg ws "$WORKSPACE" \
  '[.[] | select(.workspace.id == ($ws | tonumber))] | 
   sort_by(.at[0], .at[1]) | 
   .[].address')

# Convert to array
WINDOW_ARRAY=($WINDOWS)

# Check if index is valid
if [ $WINDOW_INDEX -lt 1 ] || [ $WINDOW_INDEX -gt ${#WINDOW_ARRAY[@]} ]; then
  exit 0
fi

# Focus the window (array is 0-indexed, user input is 1-indexed)
TARGET_WINDOW=${WINDOW_ARRAY[$((WINDOW_INDEX - 1))]}

if [ -n "$TARGET_WINDOW" ]; then
  hyprctl dispatch focuswindow address:$TARGET_WINDOW
fi
