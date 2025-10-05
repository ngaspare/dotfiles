#!/usr/bin/env bash

# Power menu options
OPTIONS="🔒 Lock
💤 Suspend
🚪 Logout
🔄 Reboot
⏻ Shutdown"

# Show rofi menu
CHOICE=$(echo "$OPTIONS" | rofi -dmenu -i -p "Power")

case "$CHOICE" in
*Lock*)
    # Use your lock command (i3lock, betterlockscreen, etc.)
    i3lock
    ;;
*Suspend*)
    systemctl suspend
    ;;
*Logout*)
    i3-msg exit
    ;;
*Reboot*)
    systemctl reboot
    ;;
*Shutdown*)
    systemctl poweroff
    ;;
*)
    # If none matched (or cancelled), do nothing
    ;;
esac