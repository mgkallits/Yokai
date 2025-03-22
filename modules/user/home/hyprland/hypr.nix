{ config, pkgs, ... }:
{

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
  #   package = null;
  #   portalPackage = null;
  # };

  # wayland.windowManager.hyprland.extraConfig = ''

  # '';
  # wayland.windowManager.hyprland = {
    # enable = true;
    # settings = {
    # };
    # extraConfig = ''
    #   device {
    #     name=razer-proclickm
    #     sensitivity=-0.5
    #   }
    #   device {
    #     name=razer-proclickm-1
    #     sensitivity=-0.5
    #   }
    # '';
 #  };

# wayland.windowManager.hyprland.systemd.enable = false;








  # home.file.".config/hypr/hyprswitch.conf" = {
  #   source = ./hyprswitch.conf;
  # };


  # home.file.".config/hypr/keybindings.conf" = {
  #   source = ./keybindings.conf;
  # };

  # home.file.".config/hypr/monitors-pc.conf" = {
  #   source = ./monitors-pc.conf;
  # };


  home.file.".config/hypr/hyprland.conf" = {
    source = ./hyprland.conf;
  };


  home.file.".config/waybar/waybar-colors.css".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.cacheHome}/wal/colors-waybar.css";


  # stylix.targets.hyprland.enable = false;







}