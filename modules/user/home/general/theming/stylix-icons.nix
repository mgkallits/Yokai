{
  config,
  pkgs,
  lib,
  ...
}:

{
  stylix.iconTheme = lib.mkForce (
    let
      getFrom = url: hash: name: {
        enable = true; # enable/disable icon theming.
        dark = name; # Dark icon theme name.
        # light = name; # Light icon theme name. Use with light icon theme!
        package =
          pkgs.runCommand # Package providing the icon theme.
            "moveUp"
            { }
            ''
              mkdir -p $out/share/icons
              ln -s ${
                pkgs.fetchzip {
                  url = url;
                  hash = hash;
                }
              }/${name} $out/share/icons/${name}
            '';
      };
    in
    getFrom "https://github.com/gusbemacbe/suru-plus/archive/refs/tags/v30.0.tar.gz"
      "sha256-YrjIrqauqSXnP1FylynC+nWIJfMZvDj/WH9NgochbKI="
      "Suru++" # Available options: "Suru++", "Suru++-Light", "eSuru++".
  );

  # Addressing behavior -> unlinked icon pack on the ~/.local/share/icons
  # Explicitly symlink the icon theme to ~/.local/share/icons
  home.file.".local/share/icons/Suru++".source =
    "${config.stylix.iconTheme.package}/share/icons/Suru++";

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
}
