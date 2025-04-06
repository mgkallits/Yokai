{ config, pkgs, ... }:

{

  # Enable D-Bus, an inter-process communication system used by many services
  # services.dbus.enable = true;
  # services.dbus.implementation = "broker"; # See: https://github.com/Vladimir-csp/uwsm/blob/master/README.md#universal-wayland-session-manager

  # boot.initrd.systemd.dbus.enable = true;
  # services.dbus.apparmor = "enabled";

}
