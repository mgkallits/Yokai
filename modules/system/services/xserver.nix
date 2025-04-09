{
  config,
  pkgs,
  ...
}:

{
  # == X Server - X11 ==

  # Disabled X server, it's not needed for Hyprland
  services.xserver.enable = false;

}
