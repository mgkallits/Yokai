{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.waybar
    # Discription: Highly customizable Wayland bar for Sway and Wlroots based compositors.
    # Homepage: https://github.com/alexays/waybar
    # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/wa/waybar/package.nix#L205
    # Programs provided: `waybar`.

    pkgs.waybar-mpris
    # Discription: Waybar component/utility for displaying and controlling MPRIS2 compliant media players individually.
    # Homepage: https://git.hrfee.pw/hrfee/waybar-mpris
    # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/wa/waybar-mpris/package.nix#L28
    # Programs provided: `waybar-mpris`.

    # pkgs.wttrbar
    # Discription: Simple but detailed weather indicator for Waybar using wttr.in.
    # Homepage: https://github.com/bjesus/wttrbar
    # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/wt/wttrbar/package.nix#L35
    # Programs provided: `wttrbar`.
  ];

}
