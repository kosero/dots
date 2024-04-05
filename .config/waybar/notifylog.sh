#!/bin/bash

# Log dosyasının yolu
logfile="/home/kosero/.config/waybar/log"

# D-Bus üzerinden gelen bildirimleri izle
dbus-monitor "interface='org.freedesktop.Notifications'" |\
# Gelen verileri işlemek için grep kullanarak filtrele
grep --line-buffered "string" |\
grep --line-buffered -e method -e ":" -e '""' -e urgency -e notify -v |\
grep --line-buffered '.*(?=string)|(?<=string).*' -oPi |\
grep --line-buffered -v '^\s*$' |\
# Gelen verileri log dosyasına yaz
while read -r line; do
    # Tarih bilgisini al ve log dosyasına ekle
    echo "---$(date)---" >> "$logfile"
    # D-Bus üzerinden gelen bildirimi log dosyasına ekle
    echo "$line" >> "$logfile"
    # Yeni satıra geç
    echo >> "$logfile"
done
