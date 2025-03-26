{ config, pkgs, ... }:

{
  programs.nm-applet.enable = false;
  programs.nm-applet.indicator = false;
}