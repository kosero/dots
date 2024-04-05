#!/bin/bash

# Ekran görüntüsünü alın ve belirtilen dizine kaydedin
file="$HOME/.config/hypr/screenshots/$(/usr/bin/date +%Y-%m-%d_%H-%M-%S).png"

# Ekranın belirli bir bölgesini seçin ve grim ile ekran görüntüsünü alın
selected_area=$(/usr/bin/slurp)
/usr/bin/grim -g "$selected_area" "$file"

# Alınan ekran görüntüsünü panoya kopyalayın
/usr/bin/cat "$file" | /usr/bin/wl-copy -t image/png

# Kullanıcıya geri bildirim verin
/usr/bin/notify-send "Ekran görüntüsü alındı ve panoya kopyalandı" "$file"