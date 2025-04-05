#!/bin/sh

# Debug: Print the path to the colors-waybar.css file
echo "Reading colors from: ~/.cache/wal/colors-waybar.css"

# Extract color1 from ~/.cache/wal/colors-waybar.css
COLOR9=$(grep -oP '(?<=@define-color color9 ).*;' ~/.cache/wal/colors-waybar.css | tr -d ';')  # Bright color

# Debug: Print the extracted color
echo "Extracted color:"
echo "COLOR1 (Active): $COLOR9"

# Check if color was extracted successfully
if [[ -z "$COLOR9" ]]; then
    echo "Error: Failed to extract color1 from ~/.cache/wal/colors-waybar.css"
    exit 1
fi

# Convert hex color to rgba format (remove '#' and add alpha value)
rgba9=$(echo "$COLOR9" | sed 's/#//' | awk '{print "rgba(" substr($1,1,2) substr($1,3,2) substr($1,5,2) "ee)"}')

# Debug: Print the rgba color
echo "RGBA color:"
echo "RGBA1 (Active): $rgba9"

# Create the new configuration lines
new_config="general {\n    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors\n    col.active_border = $rgba9\n    col.inactive_border = rgba(00000000)\n}"

# Debug: Print the new configuration lines
echo -e "New configuration lines:\n$new_config"

# Write the new configuration to ~/.config/hypr/border_colors.conf
echo -e "$new_config" > ~/.config/hypr/border_colors.conf

# Optional: Notify the user (if notify-send is installed)
if command -v notify-send &> /dev/null; then
    notify-send "Hyprland Border Colors Updated" "Active: $COLOR9\nInactive: No border"
else
    echo "notify-send not found. Skipping notification."
fi

echo "Configuration updated successfully in ~/.config/hypr/border_colors.conf."




