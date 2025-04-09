{
  inputs,
  config,
  lib,
  ylib,
  pkgs,
  username,
  version,
  ...
}:

{
  # === General settings ===
  
  # == Home-Manager Settigns ==
  
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  }; 

  programs.home-manager = { enable = true; };

  # == Font Config ==

  fonts.fontconfig.enable = true;   # Enables the FontConfig service.

  # == XDG User Directories ==

  # Manage user directories according to the XDG Base Directory Specification.
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  
  # == Home-Manager State Version ==

  # *IMPORTANT*: Don't change after initial install!
  home.stateVersion = "${version}"; # Set to your initial install version, through settings.nix.
}
