#!/usr/bin/env bash
query=$(wofi --dmenu --prompt "Arama: ")

case $query in
    gg*)
        search_query=${query:3}
        xdg-open "https://www.google.com/search?q=${search_query// /}"
        ;;
    yt*)
        search_query=${query:3}
        xdg-open "https://www.youtube.com/results?search_query=${search_query// /}"
        ;;
    spo*)
        search_query=${query:3}
        xdg-open "https://open.spotify.com/search/${search_query// /}"
        ;;
    *)
        notify-send "'gg google' 'yt youtube' 'spo spotify'"
        ;;
esac
