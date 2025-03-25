{
  config,
  lib,
  pkgs,
  inputs,
  system,
  # bleeding-edge, # -> TODO: when and if hyprswitch comes to nixpkgs, enable this feture.
  hyprswitch,
  ...
}:

{
  # TODO: check if there is a new released version on nixpkgs to remove it from bleeding-edge.
  config = lib.mkIf (hyprswitch == true) {
    environment.systemPackages = [
      inputs.hyprswitch.packages.${system}.default
      # Discription: A rust CLI/GUI to switch between windows in Hyprland.
      # Homepage: https://github.com/H3rmt/hyprswitch
      # Source:
      # Programs provided: `hyprswitch`. # NOTE: needs expantion.
    ];
  };
}
