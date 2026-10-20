#!/bin/bash
dir=~/.config/barcode_scan
state=~/.config/barcode_scan/.current

mapfile -t files < <(ls "$dir" 2>/dev/null | grep -v '^\.' | sort)
[[ ${#files[@]} -eq 0 ]] && exit 1

current=$(cat "$state" 2>/dev/null)
[[ -z "$current" || ! -f "$dir/$current" ]] && current="${files[0]}"

barcode=$(cat "$dir/$current") || exit 1
printf '%s\n' "$barcode" | xdotool type --clearmodifiers --delay 5 --file -
