CONFIG="$HOME/.config"
ICONS="$HOME/.local/share/icons"
THEMES="$HOME/.local/share/themes"

mkdir -p "$CONFIG" "$ICONS" "$THEMES"

cp -r ./config/* $CONFIG
cp -r ./icons/* $ICONS
cp -r ./themes/* $THEMES

if [[ $EUID -ne 0 ]]; then
   echo "root"
   exit 1
fi

sudo pacman -Syy hyprland xdg-desktop-portal-hyprland wofi mako neovim vim waybar ttf-jetbrains-mono swaybg alacritty --noconfirm

