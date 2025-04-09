{
  config,
  pkgs,
  lib,
  ...
}:

let
  iff = lib.mkIf;
  cfg = config.display-manager;
in
{
  # == Gnome's Display Manager ==

  services.xserver.displayManager = iff (cfg == "gdm") {
    gdm = {
      enable = true;
      wayland = true;
    };
  };

}
