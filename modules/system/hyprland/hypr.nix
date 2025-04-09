{
  inputs,
  config,
  pkgs,
  lib,
  username,
  system,
  ...
}:

let
  iff = lib.mkIf;
  merge = lib.mkMerge;
  cfg-dm = config.display-manager;
  cfg-be = config.bleeding-edge;
in
{
  # === Hyprland General Configuration ===

  # Enable necessary services for Wayland & Hyprland

  # == Hyprland ==

  programs.hyprland.enable = true;

  # The following auto-sets the package for the Hyprland's program and the portal package.
  # Notice that this way makes sure to also set the portal package, so that they are in sync,
  # if the bleeding-edge feature/setting is enabled!
  programs.hyprland = {
    package = merge [
      (optional (!cfg.be) pkgs.hyprland)
      (optional cfg.be inputs.hyprland.packages.${pkgs.system}.hyprland)
    ];
    portalPackage = merge [
      (optional (!cfg.be) pkgs.xdg-desktop-portal-hyprland)
      (optional cfg.be inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland)
    ];
  };

  # == Universal Wayland Session Manager ==

  programs.uwsm.enable = true;
  programs.hyprland.withUWSM = true;

  # == Auto-start Hyprland Session with UWSM ==

  # Adding this to the login shell enables the Hyprland servce
  programs.zsh = iff (cfg == "") {
    loginShellInit = ''
      exec uwsm app -- openrgb -p ~/.config/OpenRGB/profile.orp &

      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  # == X-Wayland ==

  # Enable X-Wayland program for x11 app compatibility
  programs.xwayland.enable = true;
  programs.hyprland.xwayland.enable = true;

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

    # Other packages...
    (pkgs.writeShellScriptBin "bitwarden" ''
      exec ${pkgs.appimage-run}/bin/appimage-run ~/.local/bin/bitwarden
    '')
    # NOTE: I moved the appimage to the .local/bin:
    # `mv ~/Downloads/Bitwarden-2025.2.1-x86_64.AppImage ~/.local/bin/bitwarden`

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
