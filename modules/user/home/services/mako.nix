{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.mako = {
    enable = true;

    # Explicitly set the font with high priority
    # font = lib.mkForce "JetBrainsMono Nerd Font";

    # Other mako configurations...
    actions = true;
    anchor = "top-right";
    borderRadius = 4;
    borderSize = 2;
    defaultTimeout = 7000;
    groupBy = "app-name,urgency";
    height = 150;
    # iconPath = "/usr/share/icons/hicolor:/usr/share/pixmaps";
    icons = true;
    ignoreTimeout = false;
    layer = "overlay";
    margin = "10,20,5";
    markup = true;
    maxIconSize = 64;
    maxVisible = 5;
    output = "";
    padding = "5";
    # progressColor = lib.mkForce "over #ffff";
    sort = "-time";
    width = 250;
  };

  home.packages = with pkgs; [
    libnotify # Provides notify-send
  ];
}
