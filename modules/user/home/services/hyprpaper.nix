{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.hyprpaper.enable = lib.mkForce false;
}
