#!/bin/sh

# Define the menu options
MENU_OPTIONS="Start Docker\nStop Docker\nRestart Docker\nKill All Containers"

# Display the menu using wofi (for Wayland)
SELECTED_OPTION=$(echo -e "$MENU_OPTIONS" | wofi --show dmenu --prompt "Docker Actions")

# Perform the selected action
case "$SELECTED_OPTION" in
    "Start Docker")
        systemctl start docker
        notify-send "Docker" "Docker daemon started."
        ;;
    "Stop Docker")
        systemctl stop docker
        notify-send "Docker" "Docker daemon stopped."
        ;;
    "Restart Docker")
        systemctl restart docker
        notify-send "Docker" "Docker daemon restarted."
        ;;
    "Kill All Containers")
        docker kill $(docker ps -q)
        notify-send "Docker" "All containers killed."
        ;;
    *)
        exit 0
        ;;
esac