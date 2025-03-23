{ inputs, config, pkgs, lib, username, system, display-manager,  ... }: 

{

  # nixpkgs.overlays =  [
  #   (import ./waybar/waybar-overlay.nix)
  # ];

  # Enable necessary services for Wayland
  # services.xserver.displayManager.defaultSession = "hyprland";
  services.xserver.enable = false;  # Disable X server (not needed for Hyprland)

  programs.uwsm.enable = true;
  programs.xwayland.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM  = true;

    # set the flake package 
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;


  };

  # programs.uwsm.waylandCompositors = {
  #   hyprland = {
  #     prettyName = "Hyprland";
  #     comment = "Hyprland compositor managed by UWSM";
  #     binPath = "${config.programs.hyprland.package}/bin/Hyprland";
  #   };
  # };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };




  programs.zsh = lib.mkIf (display-manager == "" && config.programs.uwsm.enable) { 
    loginShellInit =  ''
    exec uwsm app -- openrgb -p ~/.config/OpenRGB/profile.orp &
    
    if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
    fi
    '';
  };



  # services.xserver = {
  #   displayManager.gdm.enable = true;
  #   displayManager.gdm.wayland = true;
  # };

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = [
    pkgs.wofi
    pkgs.hyprpaper
    pkgs.swww
    # inputs.swww.packages.${pkgs.system}.swww
    pkgs.foot
    pkgs.musl
    pkgs.uwufetch
    pkgs.hyprsysteminfo
    pkgs.hyprgraphics

    pkgs.xorg.xeyes

    pkgs.dig

    # pkgs.kdePackages.qtwayland
    # pkgs.kdePackages.qtsvg

    # kdePackages.kio-fuse #to mount remote filesystems via FUSE
    # kdePackages.kio-extras #extra protocols support (sftp, fish and more)



    pkgs.waybar
 
    # Qt Wayland Support 
    # pkgs.libsForQt5.qt5.qtwayland
    # pkgs.kdePackages.qtwayland




    pkgs.wofi-power-menu
    # pkgs.nvd
    pkgs.google-chrome
    pkgs.netflix

    pkgs.playerctl
    pkgs.glib
    pkgs.gio-sharp

    pkgs.python3
    # pkgs.python3Packages.pygobject3
    pkgs.python312Packages.pygobject3
    pkgs.python313Packages.pygobject3

    pkgs.mpd
    pkgs.waybar-mpris
    
    pkgs.eww 
    
    pkgs.xwayland
    pkgs.sxhkd

    pkgs.nwg-look #GTK settings editor, designed to work properly in wlroots-based Wayland environment
  
    pkgs.vscode-fhs


    inputs.hyprswitch.packages.${system}.default








    pkgs.qjackctl
    pkgs.qpwgraph
    pkgs.helvum

    pkgs.papirus-icon-theme


    pkgs.spicetify-cli

    pkgs.radeontop
    pkgs.radeon-profile

    pkgs.imv

    pkgs.lm_sensors
    
    pkgs.stress-ng
    
    pkgs.brave



    pkgs.imagemagick

    pkgs.mlocate

    pkgs.tree 
    pkgs.htop

    pkgs.findutils.locate

    pkgs.tldr


    pkgs.btop              # Resource Manager

    pkgs.bat

  
    pkgs.neofetch


    pkgs.git               # Version Control
    pkgs.killall           # Process Killer
    pkgs.nix-tree          # Browse Nix Store


    pkgs.wget              # Retriever

    pkgs.mpv               # Media Player
    pkgs.mpvScripts.thumbfast     # High-performance on-the-fly thumbnailer for mpv


    pkgs.vlc               # Media Player

    pkgs.rsync             # Syncer - $ rsync -r dir1/ dir2/
    pkgs.zip
    pkgs.unzip

    pkgs.zathura

    pkgs.xclip


    pkgs.zoxide

    pkgs.fastfetch
    
    pkgs.obs-studio

    pkgs.spotify
  ];


# 

  # programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  # services.displayManager.enable = lib.mkForce false;

  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.autoLogin.relogin = true; # If true automatic login will kick in again on session exit (logout), otherwise it will only log in automatically when the display-manager is started.
  
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = username;


  # services.desktopManager.plasma6.enable = true;


  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    # konsole
    # oxygen
  # ];


  # virtualisation.qemu.consoles = [
  #   "ttyS0,115200n8"
  #   "tty0"
  # ];


  # fileSystems."/home/mgkallits/hdd2" = {
  #   device = "/dev/disk/by-uuid/9A049845049825F3";
  #   fsType = "ntfs";
  #   options = [ "rw" ];
  # };


  # qt = {
    # enable = true;
    # platformTheme = "gnome";
    # style = "adwaita-dark";
  # };

  # qt = {
  #   enable = true;
  #   platformTheme = "qtct";
  #   style.name = "kvantum";
  # };

  # xdg.configFile = {
  #   "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
  #   "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  # };

  programs.dconf.enable = true;
  

  security.sudo.wheelNeedsPassword = true;

  environment.localBinInPath = true;


}
