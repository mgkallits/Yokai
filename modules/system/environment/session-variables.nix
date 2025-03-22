{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.sessionVariables = {
    # XDG Base directories
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_RUNTIME_DIR = "/run/user/1000";
    XDG_BIN_HOME = "$HOME/.local/bin";

    # User directories
    XDG_DESKTOP_DIR = "$HOME/Desktop";
    XDG_DOWNLOAD_DIR = "$HOME/Downloads";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_PICTURES_DIR = "$HOME/Pictures";
    XDG_VIDEOS_DIR = "$HOME/Videos";
    XDG_MUSIC_DIR = "$HOME/Music";

    # Cursor theme
    # XCURSOR_THEME = "Simp1e-Dark";

    # PATH configuration
    # PATH = "$HOME/.local/bin:/usr/local/bin:/usr/bin:$HOME/.config/emacs/bin";

    # PATH = "$HOME/.local/bin:/usr/local/bin:/usr/bin:$HOME/.config/emacs/bin";

    # Additional environment variables
    # NIXOS_OZONE_WL = "1";
    # STARSHIP_CONFIG = "$HOME/.config/starship/starship.toml";
    # EDITOR = "emacs";
    # BROWSER = "firefox";
    # NIXPKGS_ALLOW_UNFREE = "1";
    # QT_QPA_PLATFORM = "xcb";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    # RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };

  # Shell initialization
  # environment.shellInit = ''
  #   if [ -d "$HOME/.nix-profile/share/applications" ]; then
  #     export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
  #   fi
  # '';
}
