#!/usr/bin/env bash

# Get workspace info with windows
workspaces=$(hyprctl workspaces -j)
clients=$(hyprctl clients -j 2>/dev/null || echo "[]")

# Function to get icon for app class
get_icon() {
    local class="$1"
    case "${class,,}" in
        *firefox*|*mozilla*) echo "🌐" ;;
        *chrom*|*brave*|*edge*) echo "🌐" ;;
        *terminal*|*kitty*|*alacritty*|*ghostty*|*wezterm*) echo ">" ;;
        *code*|*vscode*|*vscodium*) echo "</>" ;;
        *nvim*|*vim*|*neovim*) echo "vim" ;;
        *discord*) echo "💬" ;;
        *spotify*|*music*) echo "♪" ;;
        *thunar*|*nautilus*|*dolphin*|*pcmanfm*) echo "📁" ;;
        *gimp*|*inkscape*|*krita*) echo "🎨" ;;
        *obs*) echo "📹" ;;
        *steam*) echo "🎮" ;;
        *) echo "•" ;;
    esac
}

# Build workspace display
for i in {1..10}; do
    # Check if workspace exists and get window classes
    if echo "$clients" | grep -q "\"workspace\": $i"; then
        # Get all classes for this workspace
        classes=$(echo "$clients" | grep -A 20 "\"workspace\": $i" | grep '"class"' | cut -d'"' -f4 | head -3)
        
        icons=""
        while IFS= read -r class; do
            if [ -n "$class" ]; then
                icon=$(get_icon "$class")
                icons="${icons}${icon}"
            fi
        done <<< "$classes"
        
        if [ -n "$icons" ]; then
            echo -n "$icons "
        else
            echo -n "• "
        fi
    else
        echo -n "· "
    fi
done
