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
    "margin-top": 4,
    "margin-bottom": 0,

    "height": 38,
    "margin-left": 10,
    "margin-right": 10,
    "spacing": 8,

    // Modules Left
    "modules-left": [
        "hyprland/workspaces",
        "mpris"
    ],

    // Modules Center
    "modules-center": [
        "clock"
    ],
    
    // Modules Right    
    "modules-right": [
        "network",
        "memory",
        "cpu",
        "battery",
        "pulseaudio",
	    "tray"
    ],

	"hyprland/workspaces": {
		"format": "{icon}",
		"format-icons": {
			"1": "一",
			"2": "二",
			"3": "三",
			"4": "四",
			"5": "五",
			"6": "六",
			"7": "七",
			"8": "八",
			"9": "九",
			"10": "十"
		}
	},

	"hyprland/window": {
        "format": "<span foreground='#ffffff'>{}</span>"    
    },

	"mpris": {
		"title-len": 40,
		"interval":1,
		"format": "{player_icon} {title}",
		"format-paused": " ▶ "
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
		"format-wifi": "{bandwidthDownBits}     {bandwidthUpBits} ",
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
    font-family: "Noto Sans Regular";
    border: none;
}

window#waybar {
    background: transparent;
    color: #ebdbb2;
    opacity: 0.9;
}
#workspaces {
    background-color: #1d2021;
    color: #ebdbb2;
    border: 2px solid #ebdbb2;
    font-size: 19px;
    padding: 2px 14px 2px 14px;
    border-radius: 12px;
    transition: 300ms all;
}

#workspaces button.urgent {
    background-color: #550000;
}
#workspaces button:hover {
    background-color: rgba(211, 211, 211, 0.25);
    border-radius: 27px;
}
#workspaces button.active {
    color: #ebdbb2;
}

#custom-appmenu,
#mpris,
#window,
#clock,
#memory,
#cpu,
#temperature,
#network,
#cava,
#tray,
#backlight,
#pulseaudio,
#battery  {
    background-color: #1d2021;
    color: #ebdbb2;
    border: 2px solid #ebdbb2;
    font-size: 19px;
    padding: 2px 14px 2px 14px;
    border-radius: 12px;
    transition: 300ms all;
}

#mpris {
    padding: 0px 10px 0px 10px;
}

#memory, #cpu {
    padding: 2px 15px 2px 15px;
}

#custom-appmenu:hover,
#mpris:hover,
#workspaces:hover,
#window:hover,
#clock:hover,
#memory:hover,
#cpu:hover,
#temperature:hover,
#network:hover,
#tray:hover,
#backlight:hover,
#pulseaudio:hover,
#battery:hover  {
    color: #fbf1c7;
    background-color: #282828;
    border: 2px solid #a89984;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#network.ethernet {
    color: #ebdbb2;
}

#network.wifi {
    color: #ebdbb2;
}

#network.disconnected {
    background-color: #f53c3c;
}
#bluetooth.on, #bluetooth.connected {
    color: #ebdbb2;
}

#bluetooth.off {
    background-color: transparent;
}

#battery.charging, #battery.plugged {
    color: #ebdbb2;
}

@keyframes blink {
    to {
        color: #ebdbb2;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ebdbb2;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
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
anchor=top-center
border-size=2
border-radius=8
icon-path=/usr/share/icons/Arc-X-D
max-icon-size=65

background-color=#1d2021
border-color=#928374
text-color=#ebdbb2
# }}}

default-timeout=5000
on-button-middle=exec makoctl menu -n "$id" wofi --dmenu -p 'Select action: '

[urgency=high]
border-color=#f7768e
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
    background-color: #1d2021;
    border-radius: 30px;
    border: 2px solid #928374;
}

#input {
    margin: 5px;
    border: none;
    color: #000000;
    background-color: #928374;
    border-radius: 30px;
}

#inner-box {
    margin: 5px;
    border: none;
    background-color: #1d2021;
    border-radius: 30px;
}

#outer-box {
    margin: 15px;
    border: none;
    background-color: #1d2021;
}

#scroll {
    margin: 0px;
    border: none;
}

#text {
    margin: 5px;
    border: none;
    color: #ebdbb2;
}

#entry:selected {
    background-color: #928374;
    border-radius: 20px;
    outline: none;
    color: black;
}

#entry:selected * {
    background-color: #928374;
    border-radius: 20px;
    outline: none;
    color: black;
}
EOF


sed -i '/col.active_border/ {s/col.active_border.*/col.active_border = rgba(fbf1c7ac) rgba(ebdbb2ac) rgba(d5c4a1ac) rgba(bdae93ac) rgba(a89984ac)/}' ""$HOME/.config/hypr/hyprland.conf
sed -i '/col.inactive_border/ {s/col.inactive_border.*/col.inactive_border = rgba(928374aa)/}' ""$HOME/.config/hypr/hyprland.conf

/usr/bin/swaybg -o \* -i "$HOME/.config/hypr/scripts/wallpaper/lain.jpg" -m fill &
/usr/bin/waybar &
/usr/bin/mako &

gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark" && 
gsettings set org.gnome.desktop.interface icon-theme "Colloid-yellow" 
