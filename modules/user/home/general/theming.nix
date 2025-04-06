{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    # package = pkgs.bibata-cursors;
    # name = "Bibata-Modern-Classic";
    name = "Notwaita-Black";
    # size = 16;
  };

  gtk = {
    enable = true;

    # theme = {
    #   package = lib.mkForce pkgs.flat-remix-gtk;
    #   name = lib.mkForce "Flat-Remix-GTK-Grey-Darkest";
    # };

    # iconTheme = {
    #   package = pkgs.adwaita-icon-theme;
    #   name = "Adwaita";
    # };

    # font = {
    #   name = "Sans";
    #   size = 11;
    # };
  };
}
