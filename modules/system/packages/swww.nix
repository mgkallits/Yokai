{ config, lib, pkgs, inputs, bleeding-edge, ... }:

{
  environment.systemPackages = (
    if bleeding-edge then
      [ inputs.swww.packages.${pkgs.system}.swww ]
    else [ pkgs.swww ]
  );

  # Discription: Efficient animated wallpaper daemon for wayland, controlled at runtime.
  # Homepage: https://github.com/LGFae/swww
  # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/sw/swww/package.nix#L53
  # Programs provided: `swww`, `swww-daemon`.
}