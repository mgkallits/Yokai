{
  config,
  pkgs,
  hostname,
  ...
}:

{
  config = lib.mkIf (hostname == "tanuki") {
    services.tlp = {
      enable = true; # Whether to enable the TLP power management daemon.
    };
  };
}
