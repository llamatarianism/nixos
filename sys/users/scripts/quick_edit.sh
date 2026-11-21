pkill fuzzel 2>/dev/null || true
pkill nsxiv 2>/dev/null || true
while :
do
    file="$(find . -mindepth 1 -maxdepth 1 -printf '%f\n' | fuzzel --dmenu -w 60 -l 5 -p " > ")"

    if [ -z "$file" ]; then
        exit 0
    elif [ -d "$file" ]; then
        cd "$file" || exit 1
    else
        "$TERM" -e "$EDITOR" "$file"
        exit 0
    fi
done
