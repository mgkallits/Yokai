{
  inputs,
  config,
  pkgs,
  lib,
  username,
  system,
  display-manager,
  ...
}:

{
  # Enable necessary services for Wayland

  # services.xserver.displayManager.defaultSession = "hyprland";
  services.xserver.enable = false; # Disable X server (not needed for Hyprland)

  programs.uwsm.enable = true;
  programs.xwayland.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;

    # set the flake package
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;

  };

  programs.zsh = lib.mkIf (display-manager == "" && config.programs.uwsm.enable) {
    loginShellInit = ''
      exec uwsm app -- openrgb -p ~/.config/OpenRGB/profile.orp &

      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  services.xserver.displayManager = lib.mkIf (display-manager == "gdm") {
    gdm = {
      enable = true;
      wayland = true;
    };
  };

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = [
    pkgs.wofi
    pkgs.hyprpaper
    pkgs.foot

    pkgs.musl
    pkgs.uwufetch
    pkgs.hyprsysteminfo
    pkgs.hyprgraphics

    pkgs.xorg.xeyes

    pkgs.dig
    
    # TODO: sort out which pkgs are not nedded.

    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qtsvg

    # kdePackages.kio-fuse #to mount remote filesystems via FUSE
    # kdePackages.kio-extras #extra protocols support (sftp, fish and more)


    # Qt Wayland Support
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.kdePackages.qtwayland

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

    pkgs.eww

    pkgs.xwayland

    pkgs.nwg-look # GTK settings editor, designed to work properly in wlroots-based Wayland environment

    pkgs.vscode-fhs


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


    pkgs.imagemagick

    pkgs.mlocate

    pkgs.tree
    pkgs.htop

    pkgs.findutils.locate

    pkgs.tldr

    pkgs.btop # Resource Manager

    pkgs.bat

    pkgs.neofetch

    pkgs.git # Version Control
    pkgs.killall # Process Killer
    pkgs.nix-tree # Browse Nix Store

    pkgs.wget # Retriever

    pkgs.mpv # Media Player
    pkgs.mpvScripts.thumbfast # High-performance on-the-fly thumbnailer for mpv

    pkgs.vlc # Media Player

    pkgs.rsync # Syncer - $ rsync -r dir1/ dir2/
    pkgs.zip
    pkgs.unzip

    pkgs.zathura

    pkgs.brave

    # Other packages...
    (pkgs.writeShellScriptBin "bitwarden" ''
      exec ${pkgs.appimage-run}/bin/appimage-run ~/.local/bin/bitwarden
    '')
    # NOTE: I moved the appimage to the .local/bin:
    # `mv ~/Downloads/Bitwarden-2025.2.1-x86_64.AppImage ~/.local/bin/bitwarden`

    pkgs.R

    (pkgs.rWrapper.override {
      packages = with pkgs.rPackages;
        # let
        #   llr = buildRPackage {
        #   name = "llr";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "dirkschumacher";
        #     repo = "llr";
        #     rev = "0a654d469af231e9017e1100f00df47bae212b2c";
        #     sha256 = "0ks96m35z73nf2sb1cb8d7dv8hq8dcmxxhc61dnllrwxqq9m36lr";
        #   };
        #   propagatedBuildInputs = [ rlang  knitr];
        #   nativeBuildInputs = [ rlang knitr ];};
        # in 
        [  
          # knitr
          # rlang
          # llr
          tidyverse
          ## the rest of your R packages here
          devtools
          ggplot2
          binom
        ];
      }
    )

    pkgs.cdrkit



  ];  


  services.fwupd.enable = true;
  
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };




# ----
  # services.displayManager.enable = lib.mkForce false;

  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.autoLogin.relogin = true; # If true automatic login will kick in again on session exit (logout), otherwise it will only log in automatically when the display-manager is started.

  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = username;

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
# ----



}
