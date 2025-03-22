{ config, pkgs, ... }:

{
 programs.nh = {
    enable = true;
    package = pkgs.nh;
    clean.enable = true;
    clean.extraArgs = "--keep-since 1d --keep 3";
    flake = "/$HOME/.dotfiles";
  };
}