{
  config,
  pkgs,
  inputs,
  ylib,
  username,
  fullname,
  ...
}:

{

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  # Options
  # dwm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  environment.shells = with pkgs; [
    zsh
    bash
  ];

  programs.dconf.enable = true;
  security.sudo.wheelNeedsPassword = true;
  environment.localBinInPath = true;

  users.defaultUserShell = pkgs.zsh;

  users.users.${username} = {
    isNormalUser = true;
    description = "${fullname}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "audio"
      "docker"
      "input"
      "disk"
      "storage"
      "i2c"
      "gamemode"
      "realtime"
    ];
    packages = with pkgs; [
      bitwarden-desktop
      feh
      kitty
      # dmenu
      # slstatus
      # xsettingsd
      # xorg.xrdb
    ];
  };

  # users.mutableUsers = true;

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  services = {
    gvfs.enable = true;
  };

  # == Home Manager ==
  home-manager = {
    # useGlobalPkgs = true;
    # useUserPackages = true;
    # backupFileExtension = "backup";
    # extraSpecialArgs = import ../../settings.nix // { inherit inputs ylib; };
    users.${username} =
      { ylib, ... }:
      {
        imports = ylib.umport {
          path = ./home;
          recursive = true;
        };
      };
  };

  # === Nerdfonts of Choice ===
  # MOVED to system>fonts
  # fonts.packages = with pkgs; [  # Nerdfont icons override
  #   (nerdfonts.override { fonts = [ "CascadiaCode" "JetBrainsMono" "ComicShannsMono" "CommitMono" ]; })
  # ];

}

