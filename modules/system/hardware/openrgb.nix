{
  config,
  pkgs,
  lib,
  hostname,
  ...
}:

{

  # IMPORTANT: Please do note that installing this package by itself will lead to
  # udev rules not being set up correctly. It is recommended to have both
  # services.hardware.openrgb.enable = true; and the package installed (either
  # openrgb or openrgb-with-all-plugins)

  config = lib.mkIf (hostname == "tanuki") {
    environment.systemPackages = [
      pkgs.openrgb
      # pkgs.openrgb-with-all-plugins
    ];

    services.hardware.openrgb = {
      enable = true;
      #   package = pkgs.openrgb-with-all-plugins;
      #   motherboard = "amd";
      #   server.port = 6742;
    };
  };

}
