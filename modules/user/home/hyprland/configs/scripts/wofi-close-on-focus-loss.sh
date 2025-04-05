#!/bin/sh
wofi -nS drun -p "Wofi drun"     
# Wait for wofi to open
sleep 0.5
# Wait until wofi loses focus
while hyprctl activewindow | grep -q "Wofi drun"; do
    sleep 0.1
done
# Kill wofi when it loses focus
pkill wofi