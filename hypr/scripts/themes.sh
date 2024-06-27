#!/bin/bash

entries="Lain\nMononoke\nKosero\nArcher"

selected=$(echo -e "$entries" | /usr/bin/wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($1)}')

case $selected in
  lain)
    echo "" > "$HOME/.config/hypr/themes/themes.conf" && echo "source = $HOME/.config/hypr/themes/lain.conf" >> "$HOME/.config/hypr/themes/themes.conf";;
  mononoke)
    echo "" > "$HOME/.config/hypr/themes/themes.conf" && echo "source = $HOME/.config/hypr/themes/mononoke.conf" >> "$HOME/.config/hypr/themes/themes.conf";;
  kosero)
    echo "" > "$HOME/.config/hypr/themes/themes.conf" && echo "source = $HOME/.config/hypr/themes/kosero.conf" >> "$HOME/.config/hypr/themes/themes.conf";;
  archer)
    echo "" > "$HOME/.config/hypr/themes/themes.conf" && echo "source = $HOME/.config/hypr/themes/archer.conf" >> "$HOME/.config/hypr/themes/themes.conf";;
  *)
esac
