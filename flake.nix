{
  description = "NixOS Flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprswitch = {
      url = "github:h3rmt/hyprswitch/release";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    doom-emacs = {
      url = "github:hlissner/doom-emacs";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nypkgs,
      ...
    }:
    let
      inherit (import ./settings.nix) hostname system;
      ylib = nypkgs.lib."${system}";
    in
    {
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = import ./settings.nix // {
          inherit (nixpkgs) lib;
          inherit inputs ylib;
        };
        modules =
          ylib.umport {
            path = ./modules;
            exclude = [
              ./modules/system/boot/secure-boot/nix
              ./modules/user
            ];
          } ++
          ylib.umport {
            path = ./modules/user/${username}@${hostname}.nix
            recursive = false;
          }
          ++ [
            {
              nixpkgs.config = {
                allowUnfree = true; # Allow the installation of unfree (proprietary) packages across the system.
                # config.allowUnfreePredicate = (_: true); # A predicate function that always returns `true`,
                # allowing all unfree packages in this case.
                # Example where this is not a global permission:
                # config.allowUnfreePredicate = pkg: pkg.name == "steam";  # Only allow the "steam" package.
                # enableParallelBuildingByDefault = true;
              };
              home-manager = {
                # useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                extraSpecialArgs = import ./settings.nix // {
                  inherit inputs ylib;
                };
              };
            }
          ];
      };
    };
}
