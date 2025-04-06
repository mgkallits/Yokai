{ config, ... }:

{
  services = {
    # services.tumbler.enable = true; # Thumbnail support for images

    # qemuGuest.enable = true;
    # spice-vdagentd.enable = true;  # enable copy and paste between host and guest

    # blueman.enable = false; # -> moved to modules/system/hardware/bluetooth.nix
  };

  services = {
    # Enable EnvFS, a virtual filesystem for environment variables
    # envfs.enable = true;

    # Enable Devmon for automatic mounting and unmounting of removable devices
    devmon.enable = true;

    # Enable UDisks2 to manage disk devices and provide information about them
    udisks2.enable = true;

    # Enable GVFS (GNOME Virtual File System) for better integration with desktop applications
    gvfs.enable = true;

    # Enable printing services to support printing tasks
    # printing.enable = true;

    # Enable the Locate service for fast file searching
    # locate.enable = true;
  };
}
