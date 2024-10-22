#!/bin/bash
## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# This script for selecting wallpapers (SUPER W)
SCRIPTSDIR="$HOME/.config/hypr/scripts"
# WALLPAPERS PATH
wallDIR="$HOME/Pictures/wallpapers"
# Transition config
FPS=30
TYPE="wipe"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# Path to your Python script
PYTHON_SCRIPT="$HOME/update_hyprland_config.py"

# Check if swaybg is running
if pidof swaybg > /dev/null; then
  pkill swaybg
fi

# Retrieve image files
PICS=($(ls "${wallDIR}" | grep -E ".jpg$|.jpeg$|.png$|.gif$"))
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME="${#PICS[@]}. random"

# Rofi command
rofi_command="rofi -show -dmenu -config ~/.config/rofi/config-wallpaper.rasi"

menu() {
  for i in "${!PICS[@]}"; do
    # Displaying .gif to indicate animated images
    if [[ -z $(echo "${PICS[$i]}" | grep .gif$) ]]; then
      printf "$(echo "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${wallDIR}/${PICS[$i]}\n"
    else
      printf "${PICS[$i]}\n"
    fi
  done
  printf "$RANDOM_PIC_NAME\n"
}

swww query || swww init

main() {
  choice=$(menu | ${rofi_command})

  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    swww img "${wallDIR}/${RANDOM_PIC}" $SWWW_PARAMS
  else
    # Find the index of the selected file
    pic_index=-1
    for i in "${!PICS[@]}"; do
      filename=$(basename "${PICS[$i]}")
      if [[ "$filename" == "$choice"* ]]; then
        pic_index=$i
        break
      fi
    done

    if [[ $pic_index -ne -1 ]]; then
      swww img "${wallDIR}/${PICS[$pic_index]}" $SWWW_PARAMS
    else
      echo "Image not found."
      exit 1
    fi
  fi

  # Update colors based on new wallpaper
  ${SCRIPTSDIR}/PywalSwww.sh

  # Small delay to ensure PywalSwww.sh has finished
  sleep 0.5

  # Run the Python script to update Hyprland config
  python3 "$PYTHON_SCRIPT"

  # Refresh other components
  ${SCRIPTSDIR}/Refresh.sh
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main
