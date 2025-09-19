#!/bin/bash

# Define as opções do menu
entries="  Logout\n  Reboot\n  Shutdown"

# Mostra o wofi com as opções
selected=$(echo -e $entries | wofi --dmenu --prompt "Power Menu")

# Executa a ação baseada na escolha
case $selected in
  "  Logout")
    swaymsg exit
    ;;
  "  Reboot")
    systemctl reboot
    ;;
  "  Shutdown")
    systemctl poweroff
    ;;
esac
