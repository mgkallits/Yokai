{ config, pkgs, ... }:

let
  # Define the script's content
  scriptContent = ''
    #!/bin/sh
    # Wait for wofi to open
    sleep 1
    # Wait until wofi loses focus
    while hyprctl activewindow | grep -q "Wofi drun"; do
        sleep 0.1
    done
    # Kill wofi when it loses focus
    pkill wofi
  '';
in
{
  home.file.".local/bin/wofi-close-on-focus-loss.sh" = {
    text = scriptContent;
    executable = true;
  };
}
