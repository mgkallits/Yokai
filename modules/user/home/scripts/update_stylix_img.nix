
{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Define paths
    WALLS_DIR="$HOME/.dotfiles/modules/stylix/walls"
    DEST_FILE="$HOME/.dotfiles/modules/stylix/wallpaper"
    PICTURES_WALLS="$HOME/Pictures/Wallpapers"
    WALL_NAME_FILE="$HOME/.dotfiles/modules/stylix/wall_name"
    PYWAL_CACHE="$HOME/.cache/wal/wal"

    # Check if the Pictures/Wallpapers directory exists
    if [ ! -d "$PICTURES_WALLS" ]; then
        echo "No Wallpapers have been installed."
        exit 1
    fi

    # Check if ~/.dotfiles/modules/stylix/walls exists, if not, create and symlink
    if [ ! -d "$WALLS_DIR" ]; then
        mkdir -p "$HOME/.dotfiles/modules/stylix" # Ensure parent directory exists
        ln -s "$PICTURES_WALLS" "$WALLS_DIR"
        echo "Created and symlinked '$WALLS_DIR' to '$PICTURES_WALLS'."
    fi

    # Ensure wall_name file exists
    if [ ! -f "$WALL_NAME_FILE" ]; then
        touch "$WALL_NAME_FILE"
    fi

    # Get the current wallpaper path from pywal
    if [ ! -f "$PYWAL_CACHE" ]; then
        echo "Error: Pywal cache file not found. Is pywal running?"
        exit 1
    fi

    WALLPAPER_PATH=$(cat "$PYWAL_CACHE")
    WALLPAPER_NAME=$(basename "$WALLPAPER_PATH")

    # Check if the provided wallpaper is the same as the current one
    CURRENT_WALLPAPER=$(cat "$WALL_NAME_FILE")
    if [ "$WALLPAPER_NAME" = "$CURRENT_WALLPAPER" ]; then
        echo "Wallpaper '$WALLPAPER_NAME' is already set. Exiting."
        exit 0
    fi

    # Check if the wallpaper exists
    if [ ! -f "$WALLPAPER_PATH" ]; then
        echo "Error: Wallpaper '$WALLPAPER_NAME' not found at '$WALLPAPER_PATH'"
        exit 1
    fi

    # Copy and rename the wallpaper
    cp "$WALLPAPER_PATH" "$DEST_FILE"
    echo "$WALLPAPER_NAME" > "$WALL_NAME_FILE"
    echo "Wallpaper set to '$WALLPAPER_NAME' and copied to '$DEST_FILE'."
  '';

in {
  home.file.".local/bin/update_stylix_img.sh" = {
    text = scriptContent;
    executable = true;
  };
}












