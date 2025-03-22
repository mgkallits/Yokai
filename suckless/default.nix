{ config, lib, pkgs, inputs, username, ... }:

{ 

  # imports = [ # --> not needed after ylib.umport
  #   ./startx.nix
  # ];

  # services.xserver = { enable = true; };
  # services.xserver.excludePackages = [ pkgs.xterm ];
  # services.xserver.displayManager.lightdm.enable = fa lse;

  # services.xserver = {
  #   windowManager.dwm.enable = true;
  #   windowManager.dwm.package = pkgs.dwm.overrideAttrs { src = ./sources/dwm-6.4; };
  # };


  services.xserver = {
    # dpi = 109;  #96;
    videoDrivers = [ "amdgpu" ];
  
   # monitorSection = ''
      # Section "Monitor"
        #Identifier "DisplayPort-1"
        #Option "PreferredMode" "2560x1440"
        #Option "PreferredRefresh" "165"
      #EndSection
    #'';
  };





  environment.systemPackages = with pkgs; [

    # pywal
    
    # == dmenu ==
    # ( dmenu.overrideAttrs { src = ./sources/dmenu-5.2; } )
    # == slstatus ==
    # ( slstatus.overrideAttrs { src = ./sources/slstatus-1.0; } )

    imagemagick

    mlocate

    tree 
    htop
    # texliveFull
    # firefox
    # tree
    findutils.locate

    tldr

    # lutris
    # python3Full
    # python.pkgs.pip
    # python2
    # Terminal
    #vim
    btop              # Resource Manager
    #neovim
    bat
    st
    alacritty
  
    neofetch
    # coreutils         # GNU Utilities
    git               # Version Control
    killall           # Process Killer
    nix-tree          # Browse Nix Store
    # pciutils          # Manage PCI
    # ranger            # File Manager
    # usbutils          # Manage USB
    wget              # Retriever

    # Video/Audio

    # feh               # Image Viewer
    mpv               # Media Player

    vlc               # Media Player


    # Apps
    # appimage-run      # Runs AppImages on NixOS
    # google-chrome     # Browser
    # remmina           # XRDP & VNC Client
    # bitwarden
    # xclip
    spotify
    # notion-app-enhanced

    # xorg.libX11
    # xorg.libX11.dev
    # xorg.libxcb
    # xorg.libXft
    # xorg.libXinerama
    # xorg.xauth
    # xorg.xinit
    # libX11 libXinerama libXft
    # xorg.xinput

    # xsettingsd
    # xorg.xrdb
    # File Management
    # gnome.file-roller # Archive Manager
    # okular            # PDF Viewer
    # p7zip             # Zip Encryption
    rsync             # Syncer - $ rsync -r dir1/ dir2/
    zip
    unzip
    # xdotool
    zathura
    # xsettingsd
    lxappearance
    # wineWowPackages.full
    # winetricks
    # wpgtk
    # papirus-icon-theme
    # lutris
    # google-chrome

    xclip

    # xdg-desktop-portal-gtk
    
    # xorg.libX11
    # xorg.libX11.dev
    # xorg.libxcb
    # xorg.libXft
    # xorg.libXinerama
    # xorg.xinit
    # xorg.xinput
    # xorg.xsetroot

    zoxide

    fastfetch
    
    # gnome-keyring

  ];




  services.xserver = {
    # autorun = false;
    xkb = {
      layout = "us,gr";
      variant = ",simple";
      options = "grp:win_space_toggle";
    };
  };
  
  # services.smartd = {
  #   enable = true;
  #   autodetect = true;
  # };
  


   # === Disable Sleep ===
  #services.xserver.serverFlagsSection = ''
    #Option "BlankTime" "0"   # 10 minutes of inactivity before screen blanking
    #Option "StandbyTime" "0" # 15 minutes before entering standby mode
    #Option "SuspendTime" "0" # 20 minutes before suspending
    #Option "OffTime" "0"        # Screen off time set to 0
  #'';

  # Adds additional packages to the dbus and udev services.
# 
# - dbus.packages = [ pkgs.gcr ]: Ensures that the GCR (GNOME's 
#   Gnome Keyring library) is available via the D-Bus service. GCR 
#   provides secure password and key storage for applications that 
#   interact with D-Bus. It’s important for GNOME-based apps and 
#   other services that need access to securely stored credentials.
#
# - udev.packages = [ gnome.gnome-settings-daemon ]: Adds the 
#   GNOME Settings Daemon to the udev service, which is responsible 
#   for handling hardware-related events (e.g., plugging in a device). 
#   This daemon manages many settings related to hardware and system 
#   integration for GNOME, like display, keyboard, and mouse preferences.
# services = {
#   dbus.packages = [ pkgs.gcr ];
#   udev.packages = with pkgs; [ gnome-settings-daemon ];
# };


# Enables and configures the Syncthing and Udiskie services.
#
# - syncthing.enable = true: Starts the Syncthing service, an open-source
#   file synchronization tool. Syncthing allows you to synchronize files
#   between devices securely and without relying on cloud services. By
#   enabling this, you ensure that Syncthing runs on your system, keeping 
#   selected folders synchronized across your devices.
#
# - udiskie.enable = true: Starts the Udiskie service, which is a user-friendly 
#   daemon for automatically mounting and unmounting removable storage devices 
#   (e.g., USB drives) without requiring root privileges. With this enabled, 
#   USB drives and other external storage devices will be automatically mounted 
#   when plugged in.
# services = {
  # syncthing.enable = true;
  # auto mount USB drives
  # udiskie.enable = true;
# };

  # environment.localBinInPath = true;

}
