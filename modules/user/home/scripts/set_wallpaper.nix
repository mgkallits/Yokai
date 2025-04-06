{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh

    # Path to the wal cache file
    WAL_CACHE="$HOME/.cache/wal/wal"

    # Check if the cache file exists
    if [ ! -f "$WAL_CACHE" ]; then
      echo "Wal cache file not found: $WAL_CACHE"
      exit 1
    fi

    # Read the wallpaper path from the cache file
    WALLPAPER_PATH=$(cat "$WAL_CACHE" | sed 's/%//g')

    # Check if the wallpaper path is valid
    if [ ! -f "$WALLPAPER_PATH" ]; then
      echo "Wallpaper not found: $WALLPAPER_PATH"
      exit 1
    fi

    # Set the wallpaper with swww
    swww img "$WALLPAPER_PATH" \
      --transition-type=wave \
      --transition-step=180 \
      --transition-duration=1 \
      --transition-fps=165 \
      --transition-angle=45 \
      --transition-wave=20,20 \
      --filter=Lanczos3

    echo "Wallpaper set to: $WALLPAPER_PATH"
  '';

in
{
  home.file.".local/bin/set_wallpaper.sh" = {
    text = scriptContent;
    executable = true;
  };
}
