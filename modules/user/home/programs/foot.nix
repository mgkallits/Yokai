{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true; # Whether to enable Foot terminal.
    package = pkgs.foot; # The foot package to install
    server.enable = true; # Whether to enable Foot terminal server.
    settings = {
      # Configuration written to $XDG_CONFIG_HOME/foot/foot.ini. See https://codeberg.org/dnkl/foot/src/branch/master/foot.ini for a list of available options.
      main = {
        include = "~/.cache/wal/colors-foot.ini";
        font = "JetBrainsMono Nerd Font Mono:size=14";
        pad = "15x15";
      };
      colors = {
        alpha = 0.75;
      };
      mouse = {
        hide-when-typing = "yes";
      };
      key-bindings = {
        font-increase = "Mod1+Shift+k";
        font-decrease = "Mod1+Shift+j";
        search-start = "Mod1+Shift+f";
        clipboard-copy = "Mod1+c";
        clipboard-paste = "Mod1+v";
        scrollback-up-half-page = "Mod1+k";
        scrollback-down-half-page = "Mod1+j";
        show-urls-launch = "Mod1+Shift+l";
      };
    };
  };

  stylix.targets.foot.enable = false;

}
