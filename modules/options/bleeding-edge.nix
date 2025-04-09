{ lib, ... }:

with lib;

{
  options = {
    bleeding-edge = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = lib.mdDoc ''
        If set to true it makes the packages for Hyprland, Hyprland Portal, SWWWW and others
        to get pulled straight from github through flake's inputs.

        Caution!
        - Might brake since packages get pulled with the newest features/bugs.
        - Will make rebuilds much time consuming, because packages get build from source.

        Note: As of the time writing this, Hyprswitch isn't on the main nixpkgs repository, 
        meaning it gets pulled from github and gets build localy from source. The way to combat this 
        is to make sure to pin its version in the flake's inputs. 
      '';
      # This makes the option show up in `nixos-option display-manager`
      visible = true;
    };
  };
}