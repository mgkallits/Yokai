{ config, lib, pkgs, ... }: 

{
  nix = {
    # Specify the Nix package to use, in this case, nixFlakes for enhanced functionality
    # package = pkgs.nixFlakes;

    # Additional options for Nix configuration
    # extraOptions = "experimental-features = nix-command flakes";

    settings = {
      # Enable automatic optimization of the Nix store to improve performance
      auto-optimise-store = true;

      trusted-users = [ "root" "@wheel" ];
      
      # Enable experimental features for Nix
      experimental-features = [
        "nix-command"  # New command-line interface for Nix
        "flakes"       # Support for reproducible and composable package definitions
      ];

      # Define the default cache for Nix packages
      substituters = [ "https://cache.nixos.org" ];

      # Trusted public keys for verifying the authenticity of the packages
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];

      # Additional substituters for extra package caches
      extra-substituters = [
        "https://nix-community.cachix.org" # Nix community cache
        (lib.mkIf (config.programs.hyprland.enable) "https://hyprland.cachix.org")    # Hyprland community cache
        "https://devenv.cachix.org"      # Devenv cache for development environments
      ];

      # Additional trusted public keys for the extra substituters
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        (lib.mkIf (config.programs.hyprland.enable) "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" )
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };

  # Moved to nh configuration since I use nh for garbage collection
  # -> ` nh clean all --verbose`.
  # nix = {
  #   # Garbage Collection (GC) settings for the Nix store -> see nh
  #   gc = {
  #     automatic = true;   # Enable automatic garbage collection
  #     dates = "daily";    # Schedule GC to run daily
  #     options = "--delete-older-than 3d"; # Delete items older than 3 days
  #   };
  # };
}
