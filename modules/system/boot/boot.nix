{ config, pkgs, lib, system, ... }:

{

  # imports = [
    # ./secure-boot/lanzaboote.nix
  # ];


  # Boot Configuration
  boot = {
    # Use the latest Linux kernel packages
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader settings
    loader = {
      systemd-boot.enable = true;  # Enable the systemd-boot bootloader
      timeout = 300;
      efi.canTouchEfiVariables = true;  # Allow modification of EFI variables
    };


    # Additional bootloader settings
    loader.systemd-boot = {
      # editor = false;  # Disable kernel command-line editing for security
      consoleMode = "max";  # Set maximum console resolution
    };

    # boot.blacklistedKernelModules = [ "kvm_amd" ];

    # Kernel parameters for boot
    kernelParams = [
      "amd_pstate=active"
      "nohibernate"
      "quiet"                     # Suppress boot messages
      "splash"                    # Enable splash screen
      "vga=current"               # Set current VGA mode
      "rd.systemd.show_status=false"  # Suppress status messages during boot
      "rd.udev.log_level=3"        # Set udev log level
      "udev.log_priority=3"        # Set udev log priority

      "amdgpu.ppfeaturemask=0xffffffff" # Enable all power features
      "radeon.si_support=0"             # Disable legacy Radeon driver
      "amdgpu.si_support=1"             # Enable modern AMDGPU driver


      # "systemd.log_level=debug"

      # Source: https://github.com/NixOS/nixpkgs/issues/312452#issuecomment-2320993345
      # related to vconsole error
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
    ];

    tmp = { cleanOnBoot = true; };

    supportedFilesystems = [ "ntfs" ];



    # Console logging settings
    # consoleLogLevel = 0;  # Print all kernel messages with log level < 0

    # Initrd verbosity settings
    initrd = {
      verbose = false;  # Suppress mandatory initrd messages
      kernelModules = [ "amdgpu" ];
    };
    kernelModules = [ "amdgpu" ]; # NEEDED ?

    # Load additional kernel modules
    # kernelModules = ["v4l2loopback"];  # Load v4l2loopback for video devices
    # extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    # Kernel sysctl settings
    # kernel.sysctl = {
      # "vm.max_map_count" = 2147483642;  # Max memory map areas for processes
      # "kernel.sysrq" = 1;  # Enable SysRQ for low-level control
    # };
  };


  # services.udev.extraRules = ''
  #   KERNEL=="kfd", GROUP="video", MODE="0660"
  #   KERNEL=="dri/*", GROUP="video", MODE="0666"
  # '';



  # Console Settings
  console = {
    earlySetup = true;  # Enable early console setup
    # font = "Lat2-Terminus16";  # Set console font
    # font = "${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
    # packages = [ pkgs.terminus_font ];
    # keyMap = "us";  # Set keyboard layout
    useXkbConfig = true;
  };

   
  # System Packages
  environment.systemPackages = with pkgs; [
    niv      # Tool for managing Nix package dependencies
    sbctl    # Required for setting up lanzaboote
    kbd  # Essential for console setup

    rocmPackages.rocm-smi

  ];

  # Services Configuration
  # services.kmscon.hwRender = true;  # Enable hardware rendering for kmscon
}
