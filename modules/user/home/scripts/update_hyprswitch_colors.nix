{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Path to the CSS file
    CSS_FILE="$HOME/.config/hypr/hyprswitch.css"

    # Path to the Pywal colors file
    PYWAL_COLORS_CSS="$HOME/.cache/wal/colors.css"

    # Check if the Pywal colors file exists
    if [ ! -f "$PYWAL_COLORS_CSS" ]; then
      notify-send "Pywal colors file not found" "Please run 'wal' first."
      exit 1
    fi

    # Function to extract a specific color from the Pywal colors.css file
    extract_color() {
      local color_name="$1"
      grep -oP "(?<=--''${color_name}: ).*?(?=;)" "$PYWAL_COLORS_CSS"
    }

    # Extract colors from the Pywal colors.css file
    background=$(extract_color "background")
    foreground=$(extract_color "foreground")
    color0=$(extract_color "color0")
    color1=$(extract_color "color1")
    color2=$(extract_color "color2")
    color3=$(extract_color "color3")
    color4=$(extract_color "color4")
    color5=$(extract_color "color5")
    color6=$(extract_color "color6")
    color7=$(extract_color "color7")
    color8=$(extract_color "color8")
    color9=$(extract_color "color9")
    color10=$(extract_color "color10")
    color11=$(extract_color "color11")
    color12=$(extract_color "color12")
    color13=$(extract_color "color13")
    color14=$(extract_color "color14")
    color15=$(extract_color "color15")

    # Function to convert hex to rgba
    hex_to_rgba() {
      local hex="$1"
      local opacity="$2"
      # Remove the '#' from the hex color
      hex="''${hex#'#'}"
      # Convert hex to RGB
      r=$(printf "%d" "0x''${hex:0:2}")
      g=$(printf "%d" "0x''${hex:2:2}")
      b=$(printf "%d" "0x''${hex:4:2}")
      # Return rgba value
      echo "rgba($r, $g, $b, $opacity)"
    }

    # Map Pywal colors to hyprswitch.css variables
    border_color=$(hex_to_rgba "$color1" "0.4")           # --border-color
    border_color_active=$(hex_to_rgba "$color9" "0.9")    # --border-color-active
    bg_color=$(hex_to_rgba "$color0" "0.6")               # --bg-color
    bg_color_hover=$(hex_to_rgba "$color8" "0.7")         # --bg-color-hover
    # index_border_color=$(hex_to_rgba "$color4" "0.7")   # --index-border-color

    # Modify the CSS file with the new rgba colors
    sed -i "s|--border-color:.*|--border-color: ''${border_color};|" "$CSS_FILE"
    sed -i "s|--border-color-active:.*|--border-color-active: ''${border_color_active};|" "$CSS_FILE"
    sed -i "s|--bg-color:.*|--bg-color: ''${bg_color};|" "$CSS_FILE"
    sed -i "s|--bg-color-hover:.*|--bg-color-hover: ''${bg_color_hover};|" "$CSS_FILE"
    # sed -i "s|--index-border-color:.*|--index-border-color: ''${index_border_color};|" "$CSS_FILE"

    # Notify the user that the colors have been updated
    notify-send "Hyprswitch Colors Updated" "The colors in $CSS_FILE have been updated with rgba values based on Pywal colors."

    # Restart the hyprswitch daemon
    pkill hyprswitch
    hyprswitch -q init --show-title --size-factor 4 --custom-css ~/.config/hypr/hyprswitch.css &
    disown

    # Notify the user that the hyprswitch daemon has been restarted
    notify-send "Hyprswitch Daemon Restarted" "The hyprswitch daemon has been restarted with the new colors."
  '';

in
{
  home.file.".local/bin/update_hyprswitch_colors.sh" = {
    text = scriptContent;
    executable = true;
  };
}