icon_list=(' '  ' '  '󰖐 '  '󰖐 '  ''   ' ' ' '  '󰖔 ' ' ' ' '
           '󰼶 '  '󰼶 '  '󰙿 '  ''    ''   '󰖓 ' ' '  ' ' '󰼶 ' '󰼶 '
           '󰙿 '  ''    ''    '󰖓 '  ' ' ' ' '󰼶 '  '󰼶 ' '󰙿 ' ''
           ''    '󰖓 '  ' '  ' '  '󰼶 ' '󰼶 ' '󰙿 '  ''   ''   '󰖓 ')

weather="$(curl -sf --max-time 5 --retry 3 --retry-delay 2 https://wttr.in/?format=j2)" || exit 1

read -r temp icon < <(
  printf '%s' "$weather" | jq -r '
    .current_condition[0] // empty |
    "\(.temp_C) \(.weatherIconUrl[0].value | sub(".*wsymbol_(?<code>[0-9]{4})_.*"; "\(.code)"))"
  '
)

[[ -z "$temp" || -z "$icon" ]] && exit 1

if [[ "$temp" = "-0" ]]; then
  temp="0"
fi


printf '%s\n' "${icon_list[10#$icon - 1]}$temp°C"
