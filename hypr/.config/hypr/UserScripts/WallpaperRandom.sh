#!/bin/bash
## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Pictures/wallpapers"
scriptsDir="$HOME/.config/hypr/scripts"

# Assuming wallpaper1.jpg and wallpaper2.jpg are the two wallpapers you want to cycle through
PICS=("cyberpunk.png" "altcyberpunk.png")

# Transition config
FPS=60
TYPE="random"
DURATION=1 # Duration for transition between wallpapers
BEZIER=".43,1.19,1,.4" # Bezier curve for smooth transition

# Function to cycle through wallpapers
cycle_wallpapers() {
    local current_index=0
    local duration=120 # 12 seconds per wallpaper
    local switch_duration=1 # Switching time between wallpapers

    while true; do
        swww img "${PICS[$current_index]}" $SWWW_PARAMS
        sleep $duration
        swww img "${PICS[(($current_index+1) % ${#PICS[@]})]}" $SWWW_PARAMS
        sleep $switch_duration
        current_index=$(( (current_index + 1) % ${#PICS[@]} ))
        sleep $duration
    done
}

swww query || swww init

cycle_wallpapers

