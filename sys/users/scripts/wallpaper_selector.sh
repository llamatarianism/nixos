pkill -x fuzzel 2>/dev/null || true
pkill -x nsxiv 2>/dev/null || true
wallpath="$(nsxiv -to "${WALLPAPER_DIR:-$HOME/Pictures/Wallpapers}")"


if [[ "$wallpath" =~ [[:space:]] ]]; then
    echo "ERROR: Multiple wallpapers selected in nsxiv"
    exit 1
elif [[ -n "$wallpath" ]]; then
    pid="$(pgrep swaybg 2>/dev/null)"
    swaybg -i "$wallpath" -m fill &
    sleep 1
    if [[ -n "$pid" ]]; then
        printf '%s\n' "$pid" | xargs -r kill 2>/dev/null
    fi
else
    echo "ERROR: No wallpaper selected"
    exit 1
fi
