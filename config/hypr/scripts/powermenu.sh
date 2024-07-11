#!/bin/bash

entries="⇠ Logout\n⏾   Suspend\n⭮   Reboot\n⏻   Shutdown"

selected=$(echo -e $entries|/usr/bin/wofi -c "$HOME/.config/hypr/themes/config/wofi-config" -s "$HOME/.config/hypr/themes/mononoke/wofi-style.css" --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac