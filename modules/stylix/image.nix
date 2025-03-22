{ config, pkgs, lib, ... }:

# let
#   wallpaper = "wallhaven-85yk9o_2560x1440.png"; # Change this dynamically as needed
# in
{
  # Run the script before Stylix applies the wallpaper
  # system.activationScripts.setWallpaper = ''
  #   echo "Running set_wallpaper.sh..."
  #   /home/mgkallits/.dotfiles/modules/stylix/set_wallpaper.sh ${wallpaper}
  # '';

  # Ensure Stylix picks up the wallpaper AFTER the script runs
  stylix.image = ./wallpaper;
}