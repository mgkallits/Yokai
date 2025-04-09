{

  # === Custom Variables & Options ===

  # == Variables ==

  # User and host information
  username = "mgkallits"; # Your username
  fullname = "Marios Georgios Kallitsounakis";
  hostname = "kitsune"; # The hostname of the machine, one of: kitsune, tanuki
  system = "x86_64-linux"; # Target system architecture

  # Localization settings
  timezone = "Europe/Athens"; # Time zone configuration
  locale = "en_US.UTF-8"; # Default locale for system messages
  extralocale = "el_GR.UTF-8"; # -> Currently unused.

  # Other apps
  editor = "vim";
  # editor = "nvim";
  terminal = "kitty";
  visual = "code";
  browser = "brave";
  gitUsername = "mgkallits";
  gitEmail = "mgkallits@gmail.com";
  
  # == Custom Options/Features ==

  display-manager = ""; # one of: "gdm", "" -> no display-manager meaning you have to log in using tty or a script
  bleeding-edge = false; # whether to enable hyprland's, swww's and other program's latest features by pulling and building them from source
  hyprswitch = true; # whether to enable hyprswitch.
  # TODO: the rest
  mount-external-drives = true; # wehther to mound my external hard drives.
  secure-boot = true; # wether to enable/disable secure boot with lanzaboote.
  doomemacs = true; # whether to enable doom-emacs.
  
  # NOTE: do i need this ??
  # useuwsm = true; # Whether to enable universal waylans service manager.

  
  # ~~ State Version Variable ~~ 

  # WARNING: State Version for both System and Home-Manager
  version = "24.05"; # CAUTION! Do not change after initial setup. See ./modules/system/general/INFO.md (TODO: improve this)


}
