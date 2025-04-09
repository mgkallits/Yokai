{
  inputs,
  config,
  pkgs,
  ...
}:

{
  # === Stylix Configuration ===

  # Enable it's modules:
  imports = [ inputs.stylix.nixosModules.stylix ];

  # Enable Stylix service
  stylix = {
    enable = true;
    polarity = "dark";
    # NOTE: The following setting values get automatically created 
    # using a custom script.
    base16Scheme = ./sources/colors.yaml;
    image = ./sources/wallpaper;
  };

  # == General Opacity ==

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.75;
    desktop = 1.0;
    popups = 1.0;
  };

  # == Font Styling ==

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 14;
    desktop = 10;
    popups = 10;
  };

  # == Cursor Theming ==

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

  # ~~
  # NOTE: the icons are set on ./modules/user/home/stylix

}
