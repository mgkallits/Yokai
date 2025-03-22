{ config, pkgs, lib, ... }:


{
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   # x11.enable = true;
  #   # package = pkgs.bibata-cursors;
  #   # name = "Bibata-Modern-Classic";
  #   name = "Notwaita-Black";
  #   # size = 16;
  # };

  # gtk = {
  #   enable = true;


    # theme = {
    #   package = lib.mkForce pkgs.adw-gtk3;
    #   name = lib.mkForce "adw-gtk3";
    # };

    # theme = {
    #   package = lib.mkForce pkgs.flat-remix-gtk;
    #   name = lib.mkForce "Flat-Remix-GTK-Grey-Darkest";
    # };

    # iconTheme = {
    #   # package = pkgs.adwaita-icon-theme;
    #   name = "Suru-Plus";
    # };

    # font = {
    #   name = "Sans";
    #   size = 11;
    # };
  # };

  # qt.enable = true;
  # qt.platformTheme = lib.mkForce { name = "gtk"; };
  # qt.style.name = lib.mkForce "Suru-Plus";  


  # qt = {
  #   enable = true;
  #   platformTheme = lib.mkForce { name = "gtk3"; };# or "gtk3"
  #   # style.name = lib.mkForce "gtk4"; # or "gtk3"
  # };

}