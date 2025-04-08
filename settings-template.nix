{
  # === General custom variables that configure the System ===
  # Template for new users - customize these values for your system

  # User and host information
  username = "yourusername";
  fullname = "Your Full Name";
  hostname = "yourhostname"; # Must match one of your host directories
  system = "x86_64-linux"; # or "aarch64-linux" for ARM

  # Localization settings
  timezone = "Your/Timezone";
  locale = "en_US.UTF-8";
  extralocale = ""; # Additional locale if needed

  # Application preferences
  editor = "vim"; # or "nvim", "emacs", etc.
  terminal = "kitty"; # or "alacritty", "foot", etc.
  visual = "code"; # GUI editor
  browser = "brave"; # Enable Brave Browser

  # Feature flags
  display-manager = ""; # or "gdm", "" for none 
  bleeding-edge = false;
  mount-external-drives = false;
  secure-boot = false;
  doomemacs = false;
  hyprswitch = false;

  # System version (don't change after initial setup)
  version = "24.11";
}