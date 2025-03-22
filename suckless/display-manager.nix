{ config, pkgs, ... }:

{


  # services = {
  #   xserver = {
  #     layout = "us";
  #     displayManager = {
  #       lightdm.enable = true;
  #       setupCommands = ''
  #         ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 --mode 2560x1440 --rate 165
  #         ${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr
  #       '';
  #       autoLogin = {
  #         enable = true;
  #         user = "mgkallits";
  #       };
  #     };
  #   };
  # };

  # services.xserver.services.displayManager.sddm.enable = true;.startx = { enable = true; };
  # programs.zsh = { 
    # loginShellInit =  ''
      # if [[ "$(tty)" == "/dev/tty1" ]] then
        # startx
      # fi
    # '';
  # };
  
  # services.xserver.displayManager = {
  #   setupCommands = ''
  #     ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 --mode 2560x1440 --rate 165
  #     ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
  #       Xcursor.theme: Adwaita
  #       Xcursor.size: 64
  #     ''}
  #   '';
  # };
  

  # services.displayManager = {
  #   defaultSession = "none+dwm";
  #   autoLogin = {
  #     enable = true;
  #     user = "${username}";
  #   };
  # };





}
