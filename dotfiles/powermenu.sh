#!/bin/bash

options=" Shutdown\n Reboot\n Logout\n Suspend"

chosen=$(echo -e "$options" | fuzzel --dmenu -p "Power")

case "$chosen" in
    " Shutdown")
        poweroff
        ;;
    " Reboot")
        reboot
        ;;
    " Logout")
        niri msg action quit
        ;;
    " Suspend")
        systemctl suspend
        ;;
esac
