#!/bin/bash

if pgrep -x hypridle >/dev/null; then
    killall hypridle
    notify-send -u low -i dialog-information-symbolic -a "Hypridle" "Hypridle" "Desativado (tela sempre ligada)"
else
    hyprctl dispatch exec "hypridle -c ~/.config/hypr/hypridle.conf"
    notify-send -u low -i dialog-information-symbolic -a "Hypridle" "Hypridle" "Ativado (bloqueio/suspensão ativo)"
fi
