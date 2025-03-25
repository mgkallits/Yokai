{
  config,
  pkgs,
  lib,
  hostname,
  username,
  ...
}:

{
  config = lib.mkIf (hostname == "kitsune") {
    # Virtualization / Containers

    # virtualisation.libvirtd.enable = true;

    # == Podman ==

    # virtualisation.podman = {
    #   enable = true;
    #   dockerCompat = true;
    #   defaultNetwork.settings.dns_enabled = true;
    # };

    # == Docker ==

    virtualisation.docker = {
      enable = false;
    };

    users.groups.docker.members = [ "${username}" ];

    environment = {
      systemPackages = [
        pkgs.docker
        pkgs.docker-compose
      ];
    };

    virtualisation.docker = {
      liveRestore = false;
    }; # IMPORTANT: don't uncomment
    # Read: https://github.com/NixOS/nixpkgs/issues/182916
  };
}
