{
  config,
  pkgs,
  lib,
  hostname,
  ...
}:

{
  # See: https://discourse.nixos.org/t/how-to-use-fingerprint-unlocking-how-to-set-up-fprintd-english/21901/6

  config = lib.mkIf (hostname == "tanuki") {
    services.fprintd.enable = true;

    # services.fprintd.tod.enable = true;
    # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;

    environment.systemPackages = [
      pkgs.fprintd
      # pkgs.fprintd-tod
    ];

    # TODO: Add more steps on how to set it up.

    # services.fprintd = {
    #   enable = true;
    #   package = pkgs.fprintd-tod;
    #   tod = {
    #     enable = true;
    #     driver = pkgs.libfprint-2-tod1-vfs0090;
    #   };
    # };
  };
}
