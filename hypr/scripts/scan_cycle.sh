#!/bin/bash
dir=~/.config/barcode_scan
state=~/.config/barcode_scan/.current

mapfile -t files < <(ls "$dir" 2>/dev/null | grep -v '^\.' | sort)
[[ ${#files[@]} -eq 0 ]] && exit 1

current=$(cat "$state" 2>/dev/null)
idx=0
for i in "${!files[@]}"; do
    [[ "${files[$i]}" == "$current" ]] && idx=$i && break
done

next=$(( (idx + 1) % ${#files[@]} ))
echo "${files[$next]}" > "$state"
notify-send -u low -i dialog-information-symbolic "Barcode scan" "Ativo: ${files[$next]}"
