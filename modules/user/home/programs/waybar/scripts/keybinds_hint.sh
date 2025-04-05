#!/bin/sh

# Extract keybindings from Hyprland
jsonData=$(hyprctl binds -j)

# Format the JSON data into a readable layout
formatted_output=$(echo "$jsonData" | jq -r '
  .[] | select(.submap == "quick-launch") |
  "\(.dispatcher) > \(.key): \(.description)"
' | awk -F '>' '
{
    category = $1
    binds[category] = binds[category]? binds[category] "\n" $0 : $0
}
END {
    for (category in binds) {
        print "=== " category " ==="
        print binds[category]
        print "====================="
    }
}')

# Display the formatted output using rofi
selected=$(echo "$formatted_output" | rofi -dmenu -p "Keybinds" -theme ~/.config/rofi/style.rasi)

# Handle user selection
if [ -n "$selected" ]; then
    key=$(echo "$selected" | awk -F ':' '{print $1}' | xargs)
    case "$key" in
        "t")
            alacritty & hyprctl -q dispatch submap reset
            ;;
        "escape")
            hyprctl -q dispatch submap reset
            ;;
        *)
            echo "Unknown key: $key"
            ;;
    esac
fi