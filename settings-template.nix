{

  # === General custom variables that configure the System ===

  # User and host information
  username = "mgkallits"; # Your username
  fullname = "Marios Georgios Kallitsounakis";
  hostname = "tanuki"; # The hostname of the machine, one of: kitsune, tanuki
  system = "x86_64-linux"; # Target system architecture

  # Localization settings
  timezone = "Europe/Athens"; # Time zone configuration
  locale = "en_US.UTF-8"; # Default locale for system messages
  extralocale = "el_GR.UTF-8";

  # Other apps
  editor = "vim";
  # editor = "nvim";
  terminal = "kitty";
  visual = "code";
  browser = "brave";
  gitUsername = "mgkallits";
  gitEmail = "mgkallits@gmail.com";
  display-manager = ""; # one of: "gdm", "" -> no display-manager meaning you have to log in using tty or a script
  bleeding-edge = false; # whether to enable hyprland and other programs latest features by getting the packages staight from github instead of nixpkgs.
  mount-external-drives = false; # wehther to mound my external hard drives.
  secure-boot = false; # wether to enable/disable secure boot with lanzaboote.
  doomemacs = true; # whether to enable doom-emacs.
  hyprswitch = true; # whether to enable hyprswitch.

  # WARNING: System state version CAUTION! Do not change after initial setup (or else? TODO: improve this)
  version = "24.11";

}
