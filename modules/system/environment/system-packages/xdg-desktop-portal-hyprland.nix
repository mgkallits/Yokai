## xdg-desktop-portal backend for Hyprland ##
# Homepage: https://github.com/hyprwm/xdg-desktop-portal-hyprland
# Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/window-managers/hyprwm/xdg-desktop-portal-hyprland/default.nix#L94

{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.xdg-desktop-portal-hyprland
  ];
}