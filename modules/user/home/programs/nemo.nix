{ config, pkgs, ... }:

{

  # xdg.desktopEntries.nemo = {
  #   name = "Nemo";
  #   exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  # };

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #       "inode/directory" = [ "nemo.desktop" ];
  #       "application/x-gnome-saved-search" = [ "nemo.desktop" ];
  #   };
  # };

  # dconf = {
  #   settings = {
  #     "org/cinnamon/desktop/applications/terminal" = {
  #       exec = "foot";
  #       # exec-arg = ""; # argument
  #     };
  #   };
  # };

  home.packages = with pkgs; [
    nemo-with-extensions # This includes the preview functionality
    folder-color-switcher
    nemo-emblems
    nemo-python

    lxqt.libfm-qt
    lxqt.lxqt-menu-data

    ffmpegthumbnailer # Lightweight video thumbnailer

    # nemo-seahorse
    # nemo-share
    # eog # For image previews
    # evince # For PDF previews
  ];

}
