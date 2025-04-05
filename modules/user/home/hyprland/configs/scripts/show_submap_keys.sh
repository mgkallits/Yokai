#!/bin/sh

# Define the submap and its keybindings
SUBMAP_NAME="mysubmap"
SUBMAP_KEYBINDS=(
    "A: Notify 'You pressed A'"
    "B: Notify 'You pressed B'"
    "C: Notify 'You pressed C'"
    "Escape: Exit submap"
)

# Format the keybindings for Wofi
KEYBIND_INFO=$(printf "%s\n" "${SUBMAP_KEYBINDS[@]}")

# Display the keybindings in Wofi
echo -e "$KEYBIND_INFO" | wofi --location top-left --width 300 --height 200