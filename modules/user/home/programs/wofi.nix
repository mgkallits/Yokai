{ config, pkgs, ... }:

{
  programs.wofi.enable = true;

  programs.wofi.settings = {
    location = "center";
    insensitive = true;
    allow_images = true;
    no_actions = true;
  };

  programs.wofi.style = ''
    @import "wofi-colors.css";

    /* 🔹 Window */
    #window {
        background-color: rgba(--wofi-rgb-color0, 0.95);
        font-size: 18px;
        font-weight: bold;
        font-family: "JetBrainsMono Nerd Font Mono";
        padding: 5px;
    }

    /* 🔹 Outer Box (Margins & Spacing) */
    #outer-box {
        margin: 4px;
    }

    /* 🔹 Input Box */
    #input {
        border: none;
        background-color: transparent;
        color: --wofi-color7;
        margin: 4px;
        font-size: 16px;
        padding: 4px;
    }

    /* 🔹 Input Icon Adjustments */
    #input image:first-child {
        margin-left: -80px;
    }
    #input image:last-child {
        margin-right: -80px;
    }

    /* 🔹 Entry (Normal State) */
    #entry {
        background: transparent;
        color: --wofi-color7;
        padding: 5px;
        border-radius: 3px;
    }

    /* 🔹 Entry (Hover & Selected State) */
    #entry:selected {
        background-color: rgba(--wofi-rgb-color3, 0.85);
        color: --wofi-color0;
        box-shadow: 0px 0px 5px rgba(--wofi-rgb-color3, 0.5);
    }

    /* 🔹 Text */
    #text {
        margin-left: 6px;
        color: --wofi-color7;
    }

    /* 🔹 Selected Text */
    #text:selected {
        color: --wofi-color0;
    }

    /* 🔹 Entry Icons */
    #img {
        min-width: 20px;
        min-height: 20px;
        margin-right: 5px;
        margin-left: 5px;
    }
  '';

  home.file.".config/wofi/wofi-colors.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.xdg.cacheHome}/wal/colors-waybar.css";

  stylix.targets.wofi.enable = false;

}
