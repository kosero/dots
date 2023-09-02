#!/bin/bash

# Ekran görüntüsünü alın ve belirtilen dizine kaydedin
file="/home/kosero/.config/hypr/scripts/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"

# Ekranın belirli bir bölgesini seçin ve grim ile ekran görüntüsünü alın
selected_area=$(slurp)
grim -g "$selected_area" "$file"

# Alınan ekran görüntüsünü panoya kopyalayın
cat "$file" | wl-copy -t image/png

# Kullanıcıya geri bildirim verin
notify-send "Ekran görüntüsü alındı ve panoya kopyalandı" "$file"
