{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [


    # folder-color-switcher
    # papirus-folders
    # papirus-icon-theme
    # gtk3


    # gnomeExtensions.accent-directories

    # corectrl

    # webcord

    # python312Packages.pip

    unrar


    # networkmanager
    networkmanagerapplet

    pavucontrol


    imagemagick

    # Test your download and upload speed using fast.com
    fast-cli
    
    jq
    
    nixfmt-rfc-style

    # qbittorrent
    
    # My packages
    # vim wget killall openssl
    # git tree brave bitwarden thunderbird vlc neofetch  
    # alacritty yazi neovim zathura apacheHttpd htop dig  
    # grsync nextcloud-client python312Packages.pywal
    # pywal
    pywal16

    # Core Packages
    lld
    gcc
    glibc
    # clang
    udev
    llvmPackages.bintools
    wget
    procps
    killall
    zip
    unzip
    # bluez
    # busybox
    # bluez-tools
    # brightnessctl
    # light
    # xdg-utils
    # wireplumber
    # alsa-lib
    # pkg-config
    # kdePackages.qtsvg
    # usbutils
    # lxqt.lxqt-policykit
    # home-manager
    # mesa
   
    # LibsForQt5.qt5.qtsvg

    # sddm
    # kdePackages.sddm
    # (catppuccin-sddm.override { flavor = "mocha"; })

    # Standard Packages

    git
    fzf
    tldr
    # sox
    # yad
    # flatpak
    # ffmpeg

    # GTK Packages
    # gtk2
    # gtk3
    # gtk4
    # tela-circle-icon-theme
    # bibata-cursors

    # QT Packages
    # qtcreator
    # qt5.qtwayland
    # qt6.qtwayland
    # qt6.qmake
    # libsForQt5.qt5.qtwayland
    # qt5ct
    # gsettings-qt

    # Xorg Libraries
    # xorg.libX11
    # xorg.libXcursor

    # Other Hyprdots dependencies
    # hyprland
    # xwayland
    # cliphist
    # alacritty
    # swaynotificationcenter
    # lxde.lxsession
    # gtklock
    # eww
    xdg-desktop-portal-hyprland
    # where-is-my-sddm-theme
    # firefox
    # blueman
    # trash-cli
    # ydotool
    # lsd
    # parallel
    # pwvucontrol
    # pamixer
    # udiskie
    # dunst
    # swaylock-effects
    # wlogout
    # hyprpicker
    # slurp
    # swappy

    # xdg-desktop-portal-gtk
    # jq
    # kdePackages.qtimageformats
    # kdePackages.ffmpegthumbs
    # kdePackages.kde-cli-tools
    # libnotify
    # libsForQt5.qt5.qtquickcontrols
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects
    # libsForQt5.qt5ct
    # libsForQt5.qtstyleplugin-kvantum
    # kdePackages.qtstyleplugin-kvantum
    # kdePackages.qt6ct
    # kdePackages.wayland
    # rofi-wayland
    # nwg-look
    # ark
    # dolphin
    # kitty
    # eza
    # oh-my-zsh
    # zsh
    # zsh-powerlevel10k
    # envsubst
    # hyprcursor
    # gnumake
    # tree
    # papirus-icon-theme
    # wofi
    # vim
    # git
    # gnumake
    # cachix
    # wl-clipboard
    # grim
    # grimblast

    #   #### Core Packages
    #   lld gcc glibc clang udev llvmPackages.bintools
    #   wget procps killall zip unzip bluez busybox
    #   bluez-tools brightnessctl light xdg-utils
    #   pkg-config
    #   kdePackages.qtsvg usbutils lxqt.lxqt-policykit

    #   #### Standard Packages
    #   git fzf vim tldr sox yad flatpak
    #   ffmpeg neovim

    #   #### GTK
    #   gtk2 gtk3 gtk4 tela-circle-icon-theme
    #   bibata-cursors

    #   #### QT
    #   qtcreator
    #   qt5.qtwayland qt6.qtwayland qt6.qmake
    #   libsForQt5.qt5.qtwayland qt5ct
    #   gsettings-qt

    #   #### My Packages
    #   helix xfce.thunar bat discord
    #   cava neofetch cpufetch starship lolcat
    #   transmission_4-gtk slurp vlc mpv krabby
    #   zellij shellcheck thefuck gthumb cmatrix
    #   lagrange lavat localsend obs-studio obsidian
    #   cargo rustup mission-center

    #   ## Other Hyprdots dependencies
    #    xwayland cliphist alacritty 
    #   swaynotificationcenter lxde.lxsession gtklock
    #   eww 
    #   inputs.hyprwm-contrib.packages.${system}.grimblast
    #   where-is-my-sddm-theme firefox brave
    #    blueman trash-cli ydotool
    #   lsd parallel pwvucontrol pamixer udiskie dunst swaylock-effects
    #   wlogout hyprpicker slurp swappylibinput-gestures
    #   jq kdePackages.qtimageformats
    #   kdePackages.ffmpegthumbs kdePackages.kde-cli-tools libnotify
    #   libsForQt5.qt5.qtquickcontrols libsForQt5.qt5.qtquickcontrols2
    #   libsForQt5.qt5.qtgraphicaleffects libsForQt5.qt5ct
    #   libsForQt5.qtstyleplugin-kvantum kdePackages.qtstyleplugin-kvantum
    #   kdePackages.qt6ct kdePackages.wayland rofi-wayland nwg-look ark
    #   dolphin kitty eza oh-my-zsh zsh zsh-powerlevel10k
    #   pokemon-colorscripts-mac envsubst hyprcursor
    #   imagemagick gnumake tree
    #   papirus-icon-theme
    # ];

    # # Font stuff:
    # fonts.fontDir.enable = true;
    # fonts.packages = with pkgs; [
    #   noto-fonts noto-fonts-emoji noto-fonts-cjk
    #   (nerdfonts.override {fonts = ["JetBrainsMono"];})
    #   symbola noto-fonts-color-emoji material-icons
    #   font-awesome atkinson-hyperlegible
  ];
}
