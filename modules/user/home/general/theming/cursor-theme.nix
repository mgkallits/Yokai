{
  config,
  pkgs,
  lib,
  ...
}:

{

  # home.pointerCursor = lib.mkForce (let
  #   getFrom = url: hash: name: {
  #     qt.enable = true;
  #     gtk.enable = true;
  #     # -- disable those in order to be able to create the xresources file --
  #     x11.enable = true;
  #     x11.defaultCursor = "default";
  #     # ---
  #     name = name;
  #     size = 20;
  #     package = pkgs.runCommand "moveUp" {} ''
  #       mkdir -p $out/share/icons
  #       ln -s ${pkgs.fetchzip {
  #         url = url;
  #         hash = hash;
  #       }} $out/share/icons/${name}
  #     '';
  #   };
  # in
  #   getFrom
  #     "https://github.com/ful1e5/notwaita-cursor/releases/download/v1.0.0-alpha1/Notwaita-Black.tar.xz"
  #     "sha256-ZLr0C5exHVz6jeLg0HGV+aZQbabBqsCuXPGodk2P0S8="
  #     "Notwaita-Black"
  # );
}
