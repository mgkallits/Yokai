{ config, pkgs, lib, ... }:

{
  programs.kitty = {
      enable = true;
      # font.name = "JetBrainsMono Nerd Font Mono";
      # font.size = 14.0;
      # themeFile = "gruvbox-dark-hard"; # find more here: https://github.com/kovidgoyal/kitty-themes/tree/master/themes
      settings = {
          window_padding_width = "16.0";
          # kitty_mod = "ctrl";
          disable_ligatures = "never";
          open_url_with = "brave";
          enabled_layouts = "tall,*";
          cursor_shape = "beam";
          confirm_os_window_close = 0;
          enable_audio_bell = "no";
          resize_debounce_time = "0";
          # background_opacity = lib.mkForce 0.73000;
          background_blur = 1;
      };
      # extraConfig = "include ~/.cache/wal/colors-kitty.conf";
  };
}