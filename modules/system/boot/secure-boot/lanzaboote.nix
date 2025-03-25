{
  config,
  pkgs,
  lib,
  hostname,
  inputs,
  secure-boot,
  ...
}:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = lib.mkIf (hostname == "kitsune" && secure-boot == true) {

    environment.systemPackages = [ pkgs.sbctl ];

    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote.enable = true;
    boot.lanzaboote.pkiBundle = "/etc/secureboot";
  };
}
