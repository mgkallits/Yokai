{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    echo "Running script to change doom emacs colors"

    # Set paths
    PALETTE_PATH="$HOME/.config/stylix/palette.json"
    OUTPUT_PATH="$HOME/.cache/wal/colors.json"

    # Ensure the palette.json file exists
    if [ ! -f "$PALETTE_PATH" ]; then
      echo "Error: palette.json not found at $PALETTE_PATH"
      exit 1
    fi

    # Function to extract values from JSON without jq
    extract_json_value() {
      local key="$1"
      local file="$2"
      grep -oP '(?<=\"'"$key"'\": \")([^\"]+)' "$file"
    }

    # Read colors from palette.json
    base00=$(extract_json_value 'base00' "$PALETTE_PATH")
    base01=$(extract_json_value 'base01' "$PALETTE_PATH")
    base02=$(extract_json_value 'base02' "$PALETTE_PATH")
    base03=$(extract_json_value 'base03' "$PALETTE_PATH")
    base04=$(extract_json_value 'base04' "$PALETTE_PATH")
    base05=$(extract_json_value 'base05' "$PALETTE_PATH")
    base06=$(extract_json_value 'base06' "$PALETTE_PATH")
    base07=$(extract_json_value 'base07' "$PALETTE_PATH")
    base08=$(extract_json_value 'base08' "$PALETTE_PATH")
    base09=$(extract_json_value 'base09' "$PALETTE_PATH")
    base0A=$(extract_json_value 'base0A' "$PALETTE_PATH")
    base0B=$(extract_json_value 'base0B' "$PALETTE_PATH")
    base0C=$(extract_json_value 'base0C' "$PALETTE_PATH")
    base0D=$(extract_json_value 'base0D' "$PALETTE_PATH")
    base0E=$(extract_json_value 'base0E' "$PALETTE_PATH")
    base0F=$(extract_json_value 'base0F' "$PALETTE_PATH")

    # Create the colors.json content
    cat << EOF > "$OUTPUT_PATH"
    {
        "wallpaper": "$HOME/Desktop/wallhaven-j8z12w.jpg",
        "alpha": "100",

        "special": {
            "background": "#$base00",
            "foreground": "#$base07",
            "cursor": "#$base07"
        },
        "colors": {
            "color0": "#$base00",
            "color1": "#$base08",
            "color2": "#$base0B",
            "color3": "#$base0A",
            "color4": "#$base0D",
            "color5": "#$base0E",
            "color6": "#$base0C",
            "color7": "#$base05",
            "color8": "#$base03",
            "color9": "#$base08",
            "color10": "#$base0B",
            "color11": "#$base0A",
            "color12": "#$base0D",
            "color13": "#$base0E",
            "color14": "#$base0C",
            "color15": "#$base07"
        }
    }
    EOF

    # Confirm success
    if [ $? -eq 0 ]; then
      echo "colors.json has been successfully created at $OUTPUT_PATH"
    else
      echo "Error: Failed to create colors.json"
      exit 1
    fi
  '';

in
{
  home.file.".local/bin/wal-colors-json.sh" = {
    text = scriptContent;
    executable = true;
  };
}
