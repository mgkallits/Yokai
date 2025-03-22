{ config, pkgs, lib, ... }:
{
  services.mako = {
    enable = true;

    # Explicitly set the font with high priority
    # font = lib.mkForce "monospace 10";

    # Other mako configurations...
    actions = true;
    anchor = "top-right";
    borderRadius = 5;
    borderSize = 1;
    defaultTimeout = 5000;
    groupBy = "app-name,urgency";
    height = 150;
    iconPath = "/usr/share/icons/hicolor:/usr/share/pixmaps";
    icons = true;
    ignoreTimeout = false;
    layer = "overlay";
    margin = "10,20,5";
    markup = true;
    maxIconSize = 64;
    maxVisible = 5;
    output = "";
    padding = "5";
    sort = "-time";
    width = 300;
  };

  home.packages = with pkgs; [
    libnotify  # Provides notify-send
  ];
}