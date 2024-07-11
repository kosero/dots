#!/bin/bash

### CLEAR
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

### WAYBAR
# config
cat <<EOF >$HOME/.config/waybar/config.jsonc
{
    // General Settings

    // Position TOP
    "layer": "top",
    "margin-top": 10,
    "margin-bottom": 10,
    "position": "left",

    //"heighti: 38,
    "width": 69,
    "margin-left": 4,
    "margin-right": 4,
    "spacing": 8,

    // Modules Left
    "modules-left": [
        "mpris"
    ],

    // Modules Center
    "modules-center": [
        "hyprland/workspaces"
    ],

    // Modules Right
    "modules-right": [
        "tray",
        "memory",
        "cpu",
        "battery",
        "pulseaudio",
        "clock"
    ],

	"hyprland/workspaces": {
		"format": "{icon}",
		"format-icons": {
         "active-only": false,
            "urgent": "",
            "active": "",
            "default": ""
         },
	},

	"hyprland/window": {
        "format": "<span foreground='#ffffff'>{}</span>"
    },

	"mpris": {
		"interval":1,
		"format": "",
		"format-paused": ""
	},

	"custom/appmenu": {
		"format": "Kosero?",
		"on-click": "sh $HOME/.config/hypr/scripts/powermenu.sh",
		"tooltip": false
	},

	"tray": {
		"icon-size": 24,
	},

	"clock": {
		"format": "{:%H:%M}",
		"tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
		"today-format": "<b>{}</b>",
	},

	"memory": {
		"format": "{}% ",
		"interval": 1
	},
	"cpu": {
		"interval": 1,
		"format": "{usage}%  󰍛",
		"on-click": "/usr/bin/alacritty -e btop"
	},
	"custom/exit": {
		"format": "󰐥",
		"on-click": "sh $HOME/.config/hypr/scripts/powermenu.sh"

	},
	
	"temperature": {
        "interval": 1,
        "critical-threshold": 80,
        "format-critical": " {temperatureC}°C",
        "format": "{icon} {temperatureC}°C",
        "format-icons": ""
    },

	"network": {
		"format-wifi": "{bandwidthDownBits}\n{bandwidthUpBits}",
		"format-ethernet": "{ifname} ",
		"format-linked": "{ifname} ",
		"format-disconnected": "",
		"interval": 1,
		"interface": "wlan0",
		"on-click": "/usr/bin/alacritty -e nmtui"
	},
	
	"pulseaudio": {
		"format": "{volume}% {icon}",
		"format-bluetooth": "{volume}% ",
		"format-bluetooth-muted": "{volume}%  ",
		"format-muted": "{volume}% ",
		"format-icons": {
			"headphone": "",
			"hands-free": "",
			"headset": "",
			"phone": "",
			"portable": "",
			"car": "",
			"default": [
				"",
				" ",
				" "
			]
		},
		"on-click": "pavucontrol"
		
	},

    "backlight": {
        // "device": "acpi_video1",
        "format": "{percent}% {icon}",
        "format-icons": ["", "", "", "", "", "", "", "", ""]
    },
	
    "battery": {
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}% {icon} ",
        "format-full": "{capacity}% {icon} ",
        "format-charging": "{capacity}% 󰂄",
        "format-plugged": "{capacity}% ",
        "format-alt": "{time} {icon} ",
        "format-critical": "{capacity}% 󰂃",
        "format-warning": "{capacity}% 󰂃",
        "format-full": "{capacity}% 󱟢",
        "format-icons": ["", "", "", "", ""]
    },

    "battery#bat2": {
        "bat": "BAT2"
    }
}
EOF
# style
cat <<EOF >$HOME/.config/waybar/style.css
/* -----------------------------------------------------
 * waybar
 * ----------------------------------------------------- */

 * {
    font-family: "JetBrains Mono Medium";
    border: none;
}

window#waybar {
    background: transparent;
    background-color: #1e1e2e;
    border: 3px solid #6c7086;
    color: #cdd6f4;
    border-radius: 17px;
    opacity: 0.9;
    transition: all 350ms;
}
/*
#workspaces {
    color: #000000;
    font-size: 19px;
    padding: 2px 14px 2px 14px;
    transition: 300ms all;
}*/

#workspaces button {
    color: #cdd6f4;
}

#workspaces button.urgent {
    background-color: #550000;
}
#workspaces button:hover {
    background-color: #313244;
}
#workspaces button.active {
    background-color: #45475a;
    font-size: 24px;
}

#workspaces,
#custom-appmenu,
#mpris,
#window,
#clock,
#memory,
#cpu,
#temperature,
#network,
#backlight,
#pulseaudio,
#battery  {
    font-size: 14px;
    padding: 2px 6px 2px 6px;
    margin: 6px 0 6px 0;
    transition: 200ms all;
}

#custom-appmenu:hover,
#mpris:hover,
#window:hover,
#clock:hover,
#memory:hover,
#cpu:hover,
#temperature:hover,
#network:hover,
#backlight:hover,
#pulseaudio:hover,
#battery:hover  {
    color: #b4befe;
}

#mpris {
    padding-top: 16px;
}

#clock {
    padding-bottom: 16px;
}
EOF

### MAKO
#config
cat <<EOF >$HOME/.config/mako/config
# vim:fileencoding=utf-8:ft=dosini:fdm=marker foldlevel=0

# Appearance {{{
font=Inter Medium 11
width=350
padding=10
margin=10
anchor=bottom-right
border-size=2
border-radius=8
icon-path=/usr/share/icons/Arc-X-D
max-icon-size=65

background-color=#1e1e2e
border-color=#9399b2
text-color=#cdd6f4
# }}}

default-timeout=5000
on-button-middle=exec makoctl menu -n "$id" wofi --dmenu -p 'Select action: '

[urgency=high]
border-color=#f38ba8
ignore-timeout=1
EOF

### WOFI
#config
cat <<EOF >$HOME/.config/wofi/config
allow_images = true
EOF

#styles
cat <<EOF >$HOME/.config/wofi/style.css
window {
    margin: 0px;
    background-color: #1e1e2e;
    border-radius: 30px;
    border: 2px solid #7f849c;
}

#input {
    margin: 5px;
    border: none;
    color: #cdd6f4;
    background-color: #bac2de;
    border-radius: 30px;
}

#inner-box {
    margin: 5px;
    border: none;
    border-radius: 30px;
}

#outer-box {
    margin: 15px;
    border: none;
}

#scroll {
    margin: 0px;
    border: none;
}

#text {
    margin: 5px;
    border: none;
    color: #cdd6f4;
}

#entry:selected {
    background-color: #cba6f7;
    border-radius: 20px;
    outline: none;
    color: black;
}

#entry:selected * {
    background-color: #cba6f7;
    border-radius: 20px;
    outline: none;
    color: black;
}
EOF

sed -i '/col.active_border/ {s/col.active_border.*/col.active_border = rgba(9399b2ac) rgba(7f849cac) rgba(6c7086ac)/}' $HOME/.config/hypr/hyprland.conf
sed -i '/col.inactive_border/ {s/col.inactive_border.*/col.inactive_border = rgba(313244aa)/}' $HOME/.config/hypr/hyprland.conf

/usr/bin/swaybg -o \* -i "$HOME/.config/hypr/scripts/wallpaper/Leaves.png" -m fill &
/usr/bin/waybar &
/usr/bin/mako &

gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Mauve-Dark" && 
gsettings set org.gnome.desktop.interface icon-theme "Colloid-Purple-Dark"

