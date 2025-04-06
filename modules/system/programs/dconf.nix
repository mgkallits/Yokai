# Enables the dconf service on NixOS, which is a low-level configuration
# system for managing application settings. Many GNOME-based applications
# use dconf to store their preferences (e.g., interface settings,
# background settings, etc.). By setting this option to true, you ensure
# that dconf is available and running, allowing these applications to
# properly load and save user configurations.
# INFO: https://en.wikipedia.org/wiki/Dconf
{ config, pkgs, ... }:
{
  programs.dconf = {
    enable = true;
  };
}
