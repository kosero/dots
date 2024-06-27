#!/bin/bash 
if pgrep -x "waybar" > /dev/null
then
    killall waybar
fi

if pgrep -x "swaybg" > /dev/null
then
    killall swaybg
fi

if pgrep -x "mako" > /dev/null
then
    killall mako
fi

/usr/bin/waybar -c "$HOME/.config/waybar/config.jsonc" -s "$HOME/.config/waybar/lain-waybar-style.css" &
/usr/bin/mako --config "$HOME/.config/mako/lain-mako-config" & 
/usr/bin/swaybg -o \* -i "$HOME/.config/hypr/themes/wallpaper/lain.jpg" -m fill &

gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark-BL" && 
gsettings set org.gnome.desktop.interface icon-theme "Colloid-yellow"