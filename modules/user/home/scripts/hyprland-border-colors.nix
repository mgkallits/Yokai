
{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Debug: Print the path to the colors-waybar.css file
    echo "Reading colors from: ~/.cache/wal/colors-waybar.css"

    # Extract color3 from ~/.cache/wal/colors-waybar.css
    COLOR3=$(grep -oP '(?<=@define-color color3 ).*;' ~/.cache/wal/colors-waybar.css | tr -d ';')  # Bright color

    # Debug: Print the extracted color
    echo "Extracted color:"
    echo "COLOR3 (Active): $COLOR3"

    # Check if color was extracted successfully
    if [[ -z "$COLOR3" ]]; then
        echo "Error: Failed to extract color3 from ~/.cache/wal/colors-waybar.css"
        exit 1
    fi

    # Convert hex color to rgba format (remove '#' and add alpha value)
    rgba3=$(echo "$COLOR3" | sed 's/#//' | awk '{print "rgba(" substr($1,1,2) substr($1,3,2) substr($1,5,2) "ee)"}')

    # Debug: Print the rgba color
    echo "RGBA color:"
    echo "RGBA3 (Active): $rgba3"

    # Create the new configuration lines
    new_config="general {\n    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors\n    col.active_border = $rgba3\n    col.inactive_border = rgba(00000000)\n}"

    # Debug: Print the new configuration lines
    echo -e "New configuration lines:\n$new_config"

    # Write the new configuration to ~/.config/hypr/border_colors.conf
    echo -e "$new_config" > ~/.config/hypr/border_colors.conf

    # Optional: Notify the user (if notify-send is installed)
    if command -v notify-send &> /dev/null; then
        notify-send "Hyprland Border Colors Updated" "Active: $COLOR3\nInactive: No border"
    else
        echo "notify-send not found. Skipping notification."
    fi

    echo "Configuration updated successfully in ~/.config/hypr/border_colors.conf."
  '';

in {
  home.file.".local/bin/update_border_colors.sh" = {
    text = scriptContent;
    executable = true;
  };
}



