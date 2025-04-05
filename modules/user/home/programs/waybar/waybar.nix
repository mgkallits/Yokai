{
  config,
  lib,
  pkgs,
  hostname,
  ...
}:

{
  programs.waybar.enable = true;
  # programs.waybar.package = null;

  programs.waybar.settings = {
    mainBar = {
      position = "top";
      height = 40;

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];

      modules-center =
        [
          "custom/media"
          "systemd-failed-units"
        ]
        ++ (
          if (hostname == "kitsune") then
            [
              "gamemode"
            ]
          else
            [ ]
        );

      modules-right =
        [
          "custom/mic"
          "idle_inhibitor"
          "group/hyprkeyboard"
          "network"
          "bluetooth"
          "backlight"
        ]
        ++ (
          if (hostname == "tanuki") then
            [
              "group/laptop-bat"
            ]
          else
            [ ]
        )
        ++ [
          "wireplumber"
          "group/resources"
          "clock"
          "custom/actions"
          "tray"
        ];

      include =
        [
          "~/.config/waybar/modules/hypr.jsonc"
          "~/.config/waybar/modules/network.jsonc"
          "~/.config/waybar/modules/audio.jsonc"
          "~/.config/waybar/modules/system-resources.jsonc"
          "~/.config/waybar/modules/utilities.jsonc"
          "~/.config/waybar/modules/power.jsonc"
        ]
        ++ (
          if (hostname == "tanuki") then
            [
              "~/.config/waybar/modules/laptop-bat.jsonc"
            ]
          else
            [ ]
        );
    };
  };

  stylix.targets.waybar.enable = false;

  programs.waybar.style = ''
    @import "colors-waybar.css";
    @import "styles/_global.css";
    @import "styles/_modules.css";
    @import "styles/_wireplumber-privacy_mic.css";
    @import "styles/_hyprworkspaces.css";
    @import "styles/_system-resources.css";
    @import "styles/_hyprkeyboard.css";
    ${lib.optionalString (hostname == "tanuki") ''@import "styles/_laptop-battery.css";''}
  '';

  home.file = {
    ".config/waybar/colors-waybar.css".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.cacheHome}/wal/colors-waybar.css";

    ".config/waybar/modules".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/user/home/programs/waybar/modules";

    ".config/waybar/styles".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/user/home/programs/waybar/styles";

    ".config/waybar/scripts/mic.sh" = {
      source = ./scripts/mic.sh;
      executable = true;
    };

    # The following three configure the media-player "center" module
    ".config/waybar/scripts/mediaplayer-wrapper.sh" = {
      source = ./scripts/mediaplayer-wrapper.sh;
      executable = true;
    };
    ".config/waybar/scripts/shell.nix" = {
      text = ''
        with import <nixpkgs> {};

        pkgs.mkShell {
          buildInputs = [
            playerctl
            python3
            python3Packages.pygobject3
          ];
        }
      '';
    };

    ".config/waybar/scripts/mediaplayer.py" = {
      source = ./scripts/mediaplayer.py;
    };

    # Resources module tooltip info
    ".config/waybar/scripts/uptime.sh" = {
      source = ./scripts/uptime.sh;
      executable = true;
    };

    # Power Actions - {Reboot Suspend PowerOff}
    ".config/waybar/power_menu.xml".source = ./power_menu.xml;
  };
}
