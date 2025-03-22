{ pkgs, ... }: {
  hardware = {
    # Enable Bluetooth support for wireless device connectivity
    bluetooth.enable = false;

    # Power on Bluetooth devices automatically at boot
    bluetooth.powerOnBoot = false;
  };
}
