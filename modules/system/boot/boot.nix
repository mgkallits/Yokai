{
  config,
  pkgs,
  lib,
  system,
  ...
}:

{
  # Boot Configuration
  boot = {
    # Use the latest Linux kernel packages
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader settings
    loader = {
      systemd-boot.enable = true; # Enable the systemd-boot bootloader
      timeout = 10;
      efi.canTouchEfiVariables = true; # Allow modification of EFI variables
    };

    # Additional bootloader settings
    loader.systemd-boot = {
      # editor = false;  # Disable kernel command-line editing for security
      consoleMode = "max"; # Set maximum console resolution
    };

    # Kernel parameters for boot
    kernelParams = [

      "acpi_backlight=native"

      # "amdgpu"
      # "iommu=soft"

      "nohibernate" # prevents hibernation (suspend-to-disk), regardless of whether swap exists.
      "quiet" # Suppress boot messages
      "splash" # Enable splash screen
      "vga=current" # Set current VGA mode
      "rd.systemd.show_status=false" # Suppress status messages during boot
      "rd.udev.log_level=3" # Set udev log level
      "udev.log_priority=3" # Set udev log priority

      # # "systemd.log_level=debug"

      # # Source: https://github.com/NixOS/nixpkgs/issues/312452#issuecomment-2320993345
      # # related to vconsole error
      # "systemd.mask=systemd-vconsole-setup.service"
      # "systemd.mask=dev-tpmrm0.device"
    ];

    tmp = {
      cleanOnBoot = true;
    };

    supportedFilesystems = [ "ntfs" ];

    # Console logging settings
    # consoleLogLevel = 0;  # Print all kernel messages with log level < 0

    # Initial RAM disk (initrd) configuration
    initrd = {
      # Boot verbosity control (set true for debugging)
      verbose = false; # false=clean boot, true=detailed initrd messages

      # Kernel modules to load in initrd (before root mount)
      kernelModules = [
        "amdgpu"
        # Early AMD GPU driver load for:
        # - Pre-root filesystem display support
        # - Graphical boot/decryption screens
        # - Systems needing early GPU initialization
      ];
    };

    # Load additional kernel modules
    # kernelModules = ["v4l2loopback"];  # Load v4l2loopback for video devices
    # extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    # Kernel sysctl settings
    # kernel.sysctl = {
    # "vm.max_map_count" = 2147483642;  # Max memory map areas for processes
    # "kernel.sysrq" = 1;  # Enable SysRQ for low-level control
    # };
  };

  # Console configuration for Wayland systems
  console = {
    # Relevant for both X11 and Wayland:
    earlySetup = true;
    # Still useful for:
    # - Early boot debugging
    # - Recovery shell keyboard support
    # - TTY console functionality
    # NOTE: setting it to flase might give slightly faster boot (micro-optimization)

    # Only affects virtual consoles (TTYs), not Wayland:
    useXkbConfig = true;
    # Can safely keep enabled because:
    # 1. Doesn't interfere with Wayland compositors
    # 2. Maintains proper keyboard layout in:
    #    - Emergency TTY sessions
    #    - Login prompts
    #    - Systemd services needing console
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    niv # Tool for managing Nix package dependencies
    sbctl # Required for setting up lanzaboote
    kbd # Essential for console setup

    # rocmPackages.rocm-smi

    radeontop # Like htop, but for AMD GPUs
    nvtopPackages.amd # nvtop for AMD GPUs

  ];

  # Services Configuration
  # services.kmscon.hwRender = true;  # Enable hardware rendering for kmscon

  # ---
  hardware.cpu.amd.updateMicrocode = true;

  # # Machine specific packages
  # environment.systemPackages = with pkgs; [

  # ];

  # boot.kernelParams = [
  #   "acpi_backlight=native"
  #   "amd_pstate=guided"
  #   "amdgpu"
  #   "iommu=soft"
  # ];

  # AMD GPU
  hardware.graphics = {
    extraPackages = with pkgs; [
      vaapiVdpau

      rocmPackages.clr
      rocmPackages.clr.icd

      amdvlk
    ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  environment.variables = {
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };
  # Most software has the HIP libraries hard-coded. Workaround:
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  services.xserver.videoDrivers = lib.mkDefault [ "modesetting" ];

}
