#!/bin/sh
# Monitor Hyprland logs for submap changes
tail -f /tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/hyprland.log | grep --line-buffered "submap" | while read -r line; do
    if echo "$line" | grep -q "submap: mysubmap"; then
        sleep 1
        ~/.config/hypr/scripts/show_submap_keys.sh
    fi
done