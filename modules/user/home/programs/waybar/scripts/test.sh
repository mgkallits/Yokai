#!/bin/sh
# Fetch the current submap
SUBMAP=$(hyprctl submap)

case $SUBMAP in
  "default")
    TOOLTIP="This is the default submap."
    ;;
  "quick-launch")
    TOOLTIP="You are in a custom submap. Use this for special keybindings!"
    ;;
  *)
    TOOLTIP="Current Submap: $SUBMAP"  # Fallback tooltip
    ;;
esac

# Output in JSON format for Waybar
echo "{\"text\": \"$SUBMAP\", \"tooltip\": \"$TOOLTIP\"}"
