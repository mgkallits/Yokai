{ pkgs, ... }:
{
  hardware = {
    # Enable Bluetooth support for wireless device connectivity
    bluetooth.enable = true;

    # Power on Bluetooth devices automatically at boot
    bluetooth.powerOnBoot = true;
  };

  # Enable the blueman service, which provides blueman-applet and blueman-manager
  services.blueman.enable = true;

  # Enable experimental features, which might lead to bugs, if you want to show battery
  # charge of bluetooth devices
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

}
