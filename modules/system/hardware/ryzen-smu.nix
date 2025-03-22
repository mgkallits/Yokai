# Source: https://github.com/svenlange2/Ryzen-5800x3d-linux-undervolting

# Enable Ryzen SMU (System Management Unit) driver for AMD Ryzen processors.
# This driver allows access to the SMU, which is necessary for undervolting
# certain AMD Ryzen CPUs, such as the Ryzen 5800X3D.

# WARNING: Using your AMD processor outside of official AMD specifications
# or factory settings (e.g., undervolting) may cause instability or damage.
# Such use is not covered under any AMD product warranty and may also void
# your board or system manufacturer's warranty. Proceed at your own risk.

{ config, pkgs, ... }:

{
  # Enable the Ryzen SMU kernel module to allow communication with the SMU.
  hardware.cpu.amd.ryzen-smu.enable = true;

  # Define a systemd service to automate the undervolting process.
  # This service performs two tasks:
  # 1. Clones the Ryzen 5800X3D undervolting repository if it doesn't already exist.
  # 2. Applies the specified undervolting offset to all CPU cores.
  systemd.services.ryzen-undervolt = {
    description = "Clone Ryzen 5800X3D Repository and Apply Undervolting";
    wantedBy = [ "multi-user.target" ]; # Start the service on boot
    after = [ "network.target" ]; # Ensure the service starts after networking is available

    serviceConfig = {
      Type = "oneshot"; # Run the service once at startup
      ExecStartPre = "${pkgs.bash}/bin/bash -c 'if [ ! -d /home/mgkallits/Repos/Ryzen-5800x3d-linux-undervolting ]; then mkdir -p /home/mgkallits/Repos && git clone https://github.com/svenlange2/Ryzen-5800x3d-linux-undervolting.git /home/mgkallits/Repos/Ryzen-5800x3d-linux-undervolting; fi'";
      ExecStart = "${pkgs.python3}/bin/python3 /home/mgkallits/Repos/Ryzen-5800x3d-linux-undervolting/ruv.py -c 8 -o -30"; # Apply undervolting offset (-30 in this case)
      User = "root"; # Run as root (required for SMU access)
    };
  };
}