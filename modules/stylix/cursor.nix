{
  config,
  pkgs,
  lib,
  ...
}:

{
  stylix.cursor = lib.mkForce (
    let
      getFrom = url: hash: name: {
        name = name;
        size = 24; # available sizes: 16 20 22 24 28 32 40 48 56 64 72 80 88 96
        package = pkgs.runCommand "moveUp" { } ''
          mkdir -p $out/share/icons
          ln -s ${
            pkgs.fetchzip {
              url = url;
              hash = hash;
            }
          } $out/share/icons/${name}
        '';
      };
    in
    # See: https://github.com/ful1e5/notwaita-cursor
    getFrom
      "https://github.com/ful1e5/notwaita-cursor/releases/download/v1.0.0-alpha1/Notwaita-Black.tar.xz"
      "sha256-ZLr0C5exHVz6jeLg0HGV+aZQbabBqsCuXPGodk2P0S8="
      "Notwaita-Black"
  );

  # Other: https://github.com/vinceliuice/McMojave-cursors
}
