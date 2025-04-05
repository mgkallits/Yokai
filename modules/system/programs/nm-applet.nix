{ config, pkgs, ... }:

{
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;
}