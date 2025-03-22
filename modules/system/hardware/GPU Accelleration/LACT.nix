# LACT (Linux AMDGPU Controller) Configuration on NixOS

# LACT is a tool designed for managing the performance of AMD GPUs on Linux systems. It provides
# capabilities for overclocking, undervolting, and configuring fan curves for AMD GPUs. On NixOS,
# integrating LACT involves setting up the application and enabling its associated daemon service
# (lactd) for automatic startup.

{ config, pkgs, ... }:

{

  # In order to install the daemon service you need to add the package to systemd.packages. Also the
  # wantedBy field should be set to multi-user.target to start the service during boot.

  # 1. Installing LACT

  #    To use LACT on NixOS, the package must be installed as part of the system environment. This ensures
  #    the LACT command-line tools are available:
  
         environment.systemPackages = with pkgs; [
           lact # This adds the lact tool to your system-wide environment, making it accessible from the command line.
         ];
  
  # 2. Adding LACT to systemd Packages

  #    To run LACT's daemon (lactd), the lact package must also be included in the systemd.packages list:

         systemd.packages = with pkgs; [
           lact # This ensures the required binaries for the lactd service are available to systemd.
         ];

  # 3. Enabling the LACT Daemon (lactd)

  #    The daemon service lactd is responsible for applying GPU performance configurations (e.g., overclocking,
  #    undervolting, fan curves) at boot. To enable it: 

         systemd.services.lactd.wantedBy = ["multi-user.target"]; # This configuration ensures that the lactd service
         # starts during system boot and remains active in a typical multi-user environment (the default run level on
         # most Linux systems).

  # How It Works?

  #   1. System Package Installation:
  #      The lact package is installed, making the LACT CLI tools available system-wide for manual configuration.

  #   2. Systemd Package Inclusion:
  #      The lact package is also made available to systemd, ensuring the necessary files for the lactd service
  #      are present.

  #   3. Service Enablement:
  #      The lactd service is configured to automatically start during boot (multi-user.target), applying GPU
  #      settings (overclocking, undervolting, fan curves) automatically.  
  

  # Using LACT

  #   Once configured:

  #   1. Manual Configuration:
  #       You can manually configure overclocking, undervolting, and fan curves using LACT commands.
  #       Example:
  #         $ lact --set-fan-speed 50  # Set the fan speed to 50%
  #   2. Automatic Configuration:
  #       The lactd service will apply predefined settings at boot. You can customize these settings by
  #       editing LACT's configuration file (usually located in /etc or /var—check LACT documentation for
  #       specifics).

}

# Summary

#   Install the LACT package:
#   Add it to environment.systemPackages for CLI tools and systemd.packages for daemon support.

#   Enable the LACT daemon (lactd):
#   Configure it to start during boot with wantedBy = ["multi-user.target"];.

#   Benefits:
#   Automatically applies GPU performance tweaks (overclocking, undervolting, fan curves) on boot without
#   manual intervention.

