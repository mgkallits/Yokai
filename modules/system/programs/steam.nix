{ pkgs, ... }:

{
  # === Steam and Gaming ===

  # Enable hardware acceleration - not needed if programs.steam is enabled
  # moved to ../system/hardware/acceleration.nix
  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  # };

  # Loading the gpu drivers for both x11 and wayland
  # moved to ../system/hardware/acceleration.nix
  # services.xserver.videoDrivers = ["amdgpu"];

  # Steam
  programs.steam.enable = true;

  programs.steam.gamescopeSession.enable = true;  # see on https://github.com/ValveSoftware/gamescope

  # Enable GameMode to optimise system performance on demand
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
        desiredgov = "performance";
        inhibit_screensaver = 1;
        disable_splitlock = 1;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
        amd_performance_level = "high";
      };
      cpu = {
        pin_cores = "yes";
        park_cores = "no";
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
      # filter = {
      #   whitelist = "Marvel Rivals";
      # };
    };
  };

  # Notes
  # use the General>Launch Options and paste the commands needed for the game you want the above apps to execute:
  # gamemoderun %command%
  # mangohub %command%
  # gamescope %command%

  # The convenient protonup command to install the proton GE
  environment.systemPackages = with pkgs; [
    protonup
    mangohud  # A good simple monitoring app
  ] ++(with pkgs; [
    lutris
    heroic
    bottles
  ]);

  # This requires us to specify the instalation path
  # so run the command:
  # protonup -d "~/.steam/root/compatibilitytools.d/"
  # then you can change the proton version needed on steam for the game

  # Other great game launchers
  # environment.systemPackages = with pkgs; [
  #   lutris
  #   heroic
  #   bottles
  # ];

  # Check this website https://www.protondb.com/
}
