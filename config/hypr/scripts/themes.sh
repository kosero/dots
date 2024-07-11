#!/bin/bash

entries="Lain\nMononoke\nKosero\nRosu"

selected=$(echo -e "$entries" | /usr/bin/wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($1)}')

case $selected in
  lain)
    sh $HOME/.config/hypr/scripts/themes/lain.sh;;
  mononoke)
    sh $HOME/.config/hypr/scripts/themes/mononoke.sh;;
  kosero)
    sh $HOME/.config/hypr/scripts/themes/kosero.sh;;
  rosu)
    sh $HOME/.config/hypr/scripts/themes/rosu.sh;;
esac
