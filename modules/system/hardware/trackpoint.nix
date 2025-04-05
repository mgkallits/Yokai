{
  config,
  lib,
  hostname,
  ...
}:

{
  config = lib.mkIf (hostname == "tanuki") {
    hardware.trackpoint.enable = true;
    hardware.trackpoint.emulateWheel = true;
  };
}
