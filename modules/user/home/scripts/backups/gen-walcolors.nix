
{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Set paths
    PALETTE_PATH="$HOME/.config/stylix/palette.json"
    OUTPUT_PATH="$HOME/.cache/wal/colors"

    # Ensure the palette.json file exists
    if [ ! -f "$PALETTE_PATH" ]; then
      echo "Error: palette.json not found at $PALETTE_PATH"
      exit 1
    fi

    # Function to extract values from JSON without jq
    extract_json_value() {
      local key="$1"
      local file="$2"
      grep -oP '(?<=\"'"$key"'\": \"?)([^\",]+)' "$file"
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
    #$base00
    #$base01
    #$base03
    #$base04
    #$base05
    #$base06
    #$base07
    #$base08
    #$base09
    #$base0A
    #$base0B
    #$base0C
    #$base0D
    #$base0E
    #$base0F
    EOF

    if [ $? -eq 0 ]; then
      echo "colors has been successfully created at $OUTPUT_PATH"
    else
      echo "Error: Failed to create colors"
      exit 1
    fi
  '';

in {
  home.file.".local/bin/wal-colors.sh" = {
    text = scriptContent;
    executable = true;
  };
}

