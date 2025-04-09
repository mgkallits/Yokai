{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.obs-studio 
  ];

  # Discription: Free and open source software for video recording and live streaming
  # Homepage: https://obsproject.com/
  # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/video/obs-studio/default.nix#L226
  # Programs provided: `obs`, `obs-ffmpeg-mux`, `obs-nvenc-test`.
}