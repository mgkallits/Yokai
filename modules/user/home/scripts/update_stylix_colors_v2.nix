{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Define paths
    input_file="$HOME/.cache/wal/colors.yml"
    output_file="$HOME/.dotfiles/modules/stylix/colors.yaml"

    # Check if the input file exists
    if [[ ! -f "$input_file" ]]; then
      echo "Error: Input file $input_file does not exist."
      exit 1
    fi

    # Create the output directory if it doesn't exist
    mkdir -p "$(dirname "$output_file")"

    # Extract colors from the input file and remove the '#' symbol
    background=$(grep "background:" "$input_file" | awk '{print $2}' | tr -d '#"')
    foreground=$(grep "foreground:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color0=$(grep "color0:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color1=$(grep "color1:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color2=$(grep "color2:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color3=$(grep "color3:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color4=$(grep "color4:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color5=$(grep "color5:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color6=$(grep "color6:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color7=$(grep "color7:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color8=$(grep "color8:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color9=$(grep "color9:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color10=$(grep "color10:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color11=$(grep "color11:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color12=$(grep "color12:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color13=$(grep "color13:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color14=$(grep "color14:" "$input_file" | awk '{print $2}' | tr -d '#"')
    color15=$(grep "color15:" "$input_file" | awk '{print $2}' | tr -d '#"')

    # Write the colors to the output file in base16 format
    cat <<EOF > "$output_file"
    base00: "$color0"
    base01: "$color2"
    base02: "$color4"
    base03: "$color14"
    base04: "$color13"
    base05: "$color15"
    base06: "$color7"
    base07: "$color11"
    base08: "$color12"
    base09: "$color10"
    base0A: "$color3"
    base0B: "$color5"
    base0C: "$color9"
    base0D: "$color6"
    base0E: "$color1"
    base0F: "$color8"
    EOF

    echo "Colors have been successfully written to $output_file"
  '';

in
{
  home.file.".local/bin/update_stylix_colors_v2.sh" = {
    text = scriptContent;
    executable = true;
  };
}