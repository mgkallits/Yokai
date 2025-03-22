{ config, pkgs, lib, display-manager, ... }:

{
  # config = lib.mkIf (display-manager == "startx") {
  #   services.xserver.displayManager.startx = { enable = true; };
  #   programs.zsh = { 
  #     loginShellInit =  ''
  #       if [[ "$(tty)" == "/dev/tty1" ]] then
  #         startx
  #       fi
  #     '';
  #   };
  # };
}
