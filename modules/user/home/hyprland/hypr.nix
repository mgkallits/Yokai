{
  config,
  pkgs,
  lib,
  hostname,
  ...
}:

let
  merge = lib.mkMerge;
  iff = lib.mkIf;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    #     # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;
    settings = {
      # Monitor configuration
      monitor = merge [
        (iff (hostname == "kitsune") [
          "DP-2, 2560x1440@165, 0x0, 1"
        ])
        (iff (hostname == "tanuki") [
          "eDP-1, 1920x1080@60, 0x0, 1"
        ])
      ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # Autostart programs
      exec-once = [
        "uwsm app -- systemctl --user start hyprpolkitagent" # polkit authentication daemon
        "uwsm app -- swww-daemon"
        "uwsm app -- waybar"
      ];

      # Program variables
      "$terminal" = "foot";
      "$fileManager" = "nemo";
      "$menu" = "wofi -nS drun -p \"Wofi drun\"";
      "$browser" = "brave";
      "$passward" = "bitwarden";

    };

    # Include additional configuration files
    extraConfig = ''
      source = ~/.config/hypr/look_and_feel.conf
      source = ~/.config/hypr/input.conf
      source = ~/.config/hypr/keybindings.conf
      source = ~/.config/hypr/windows_and_workspaces.conf
      source = ~/.config/hypr/hyprswitch.conf
    '';
  };
}

# { config, pkgs, ... }:
# {

#   wayland.windowManager.hyprland = {
#     enable = true;
#     # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
#     package = null;
#     portalPackage = null;
#     settings = {
#       ################
#       ### MONITORS ###
#       ################

# # See https://wiki.hyprland.org/Configuring/Monitors/
# # monitor=,preferred,auto,auto
# # monitor = DP-2, 2560x1440@165, 0x0, 1,

#     };
#   };

#   # wayland.windowManager.hyprland.systemd.enable = false;

#   # home.file.".config/hypr/hyprswitch.conf" = {
#   #   source = ./hyprswitch.conf;
#   # };

#   # home.file.".config/hypr/keybindings.conf" = {
#   #   source = ./keybindings.conf;
#   # };

#   # home.file.".config/hypr/monitors-pc.conf" = {
#   #   source = ./monitors-pc.conf;
#   # };

#   # home.file.".config/hypr/hyprland.conf" = {
#   #   source = ./hyprland.conf;
#   # };

#   # stylix.targets.hyprland.enable = false;

# }
