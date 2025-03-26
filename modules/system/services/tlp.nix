{
  config,
  pkgs,
  lib,
  hostname,
  ...
}:

{
  config = lib.mkIf (hostname == "tanuki") {
    services.tlp = {
      enable = false; # Whether to enable the TLP power management daemon.
    };
  };
}
