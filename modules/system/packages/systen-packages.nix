{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ### System Utilities
    libsmbios
    brightnessctl
    networkmanagerapplet
    pavucontrol
    procps
    killall
    udev
    wget
    unrar
    unzip
    zip
    jq
    fast-cli  # Network speed test

    ### Development Tools
    git
    python313
    python313Packages.tkinter
    gcc
    glibc
    lld
    llvmPackages.bintools

    ### Terminal Utilities
    fzf
    tldr
    pspp  # Statistical analysis
    pywal16  # Color scheme generator

    ### Media Tools
    imagemagick
    qbittorrent
    webcord  # Discord client

    ### Uncomment as needed
    # corectrl  # Hardware control
    # python3Packages.pip
    # networkmanager
    # clang
    # busybox
    # light  # Backlight control

    ### Previously commented packages (organized by category)
    ## Desktop Environment
    # kdePackages.sddm
    # (catppuccin-sddm.override { flavor = "mocha"; })
    # kdePackages.qtsvg
    # lxqt.lxqt-policykit
    # home-manager
    
    ## Media
    # ffmpeg
    # sox
    # yad
    
    ## GTK/QT
    # gtk2 gtk3 gtk4
    # tela-circle-icon-theme
    # bibata-cursors
    # qtcreator
    # qt5.qtwayland qt6.qtwayland
    # qt6.qmake
    # libsForQt5.qt5.qtwayland
    # qt5ct
    # gsettings-qt
    
    ## Hyprland-related
    # hyprland
    # xwayland
    # cliphist
    # swaynotificationcenter
    # gtklock
    # eww
    # hyprpicker
    # slurp
    # swappy
    # wl-clipboard
    # grim
    # grimblast
  ];

  # Fonts can be kept separately as in your original
  # fonts.fontDir.enable = true;
  # fonts.packages = with pkgs; [
  #   noto-fonts noto-fonts-emoji noto-fonts-cjk
  #   (nerdfonts.override {fonts = ["JetBrainsMono"];})
  #   symbola noto-fonts-color-emoji material-icons
  #   font-awesome atkinson-hyperlegible
  # ];
}