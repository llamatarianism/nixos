wallpath="$(find "$HOME"/Pictures/Wallpapers -type f | shuf -n 1)"

pid="$(pgrep swaybg 2>/dev/null)"

swaybg -i "$wallpath" -m fill &
sleep 1
if [[ -n "$pid" ]]; then
    printf '%s\n' "$pid" | xargs -r kill
fi
