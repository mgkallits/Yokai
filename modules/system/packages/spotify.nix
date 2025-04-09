{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.spotify
    # TODO: Do I need the `pkgs.spotifywm` or `pkgs.spotify-qt`?
  ];

  # Discription: Play music from the Spotify music service.
  # Homepage: https://www.spotify.com/
  # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/sp/spotify/package.nix#L15
  # Programs provided: This package provides no programs.
}







