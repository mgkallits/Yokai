# Vulkan and AMDVLK Configuration in NixOS

# This section of the configuration explains how to set up Vulkan on NixOS, both for 64-bit and 
# 32-bit applications, and how to optionally use the AMDVLK drivers alongside the default Mesa 
# RADV drivers.

{ config, pkgs, ... }:


{

  services.xserver.videoDrivers = [ "amdgpu" ];

  # === Vulkan ===

  # == Default Vulkan Support ==

  # Vulkan is a low-level graphics and compute API for modern GPUs, often used directly by games or 
  # indirectly via compatibility layers like DXVK. On NixOS, Vulkan is enabled by default for 64-bit
  # applications using the Mesa RADV driver.

  # By default, if hardware.graphics.enable is set, Vulkan support is enabled on NixOS.
  # This uses the Mesa RADV driver (Mesa's Vulkan implementation for AMD GPUs) for 64-bit applications.
  # Mesa provides Vulkan support for supported hardware, meaning most modern Vulkan-based games 
  # and applications will work out of the box on 64-bit systems.

  # The settings to control it are:

      hardware.graphics.enable = true; # By default enables Vulkan support for 64 bit applications

  # If you want to run Vulkan applications built for 32-bit architectures, you need to explicitly enable 
  # support for 32-bit drivers using the following configuration option:

      hardware.graphics.enable32Bit = true; # For 32 bit applications 

  # This enables Direct Rendering Infrastructure (DRI) support for 32-bit applications, allowing 
  # Vulkan programs designed for 32-bit systems (such as older games or software run through 
  # tools like Wine/Proton) to work properly.
  
  
  # == Installing Vulkan Drivers ==
  
  # NOTE: Adding the amdvlk package to hardware.graphics.extraPackages makes amdvlk the default driver 
  # and hides radv and lavapipe from the device list. (See Reference) --> True?

  # There are two main Vulkan drivers for AMD GPUs on NixOS:
  #   - RADV (Mesa): The default open-source Vulkan (driver included with Mesa) implementation for AMD GPUs.
  #     It's community-developed and optimized for gaming and general Vulkan usage.

  #   - AMDVLK: AMD’s official open-source Vulkan driver, which can coexist with RADV. While RADV is the
  #     default, you can install and use AMDVLK as an additional option. Applications will choose the
  #     driver to use based on system settings or environment variables (e.g., VK_ICD_FILENAMES).

  # Similar to OpenCL, Vulkan drivers are loaded through the Installable Client Driver (ICD) mechanism.
  # ICD files for Vulkan are JSON files that specify the path to the driver library and the supported
  # Vulkan version. All successfully loaded drivers are exposed to the application as different GPUs.

  # In NixOS, there are two ways to make ICD files visible to Vulkan applications: an environment variable
  # and a module option.

  # The first option is through the VK_ICD_FILENAMES environment variable. This variable can contain multiple
  # JSON files, separated by ":". For example:

  #   $ export \
  #     VK_ICD_FILENAMES=`nix-build '<nixpkgs>' --no-out-link -A amdvlk`/share/vulkan/icd.d/amd_icd64.json
  
  # The second mechanism is to add the Vulkan driver package to hardware.graphics.extraPackages. This links
  # the ICD file under /run/opengl-driver, where it will be visible to the ICD loader.

  # Modern AMD Graphics Core Next (GCN) GPUs are supported through either radv, which is part of mesa, or
  # the amdvlk package. Adding the amdvlk package to hardware.graphics.extraPackages makes amdvlk the default
  # driver and hides radv and lavapipe from the device list. A specific driver can be forced as follows:

  #   == Installation of the AMDVLK driver ==

  #     To add AMDVLK to your system as an additional Vulkan driver, update your hardware.graphics.extraPackages:

        #   hardware.graphics.extraPackages = [ pkgs.amdvlk ]; # For 64-Bit Applications
  
  #     This installs the AMDVLK drivers for 64-bit applications. The ICD (Installable Client Driver) 
  #     for AMDVLK will be available alongside Mesa RADV. Applications will automatically select between 
  #     AMDVLK and RADV unless overridden by environment variables.
  
  #     If you also want to support 32-bit Vulkan applications with AMDVLK, you need to explicitly install the
  #     32-bit version of AMDVLK drivers:
  
        #   hardware.graphics.extraPackages32 = [ pkgs.driversi686Linux.amdvlk ]; # For 32-Bit Applications

  #     This adds the 32-bit AMDVLK drivers to your system, making them available for applications that require
  #     32-bit Vulkan support, such as games running under Wine or Proton.

  #   == Choosing Between RADV and AMDVLK ==

  #     Adding the amdvlk package to hardware.graphics.extraPackages makes amdvlk the default driver and hides
  #     radv and lavapipe from the device list.

  #     Applications can choose between Mesa RADV and AMDVLK automatically. However, you can explicitly specify
  #     which Vulkan driver to use by setting the Vulkan related environment variable:
  
  #       Force RADV:
 
          # environment.variables.AMD_VULKAN_ICD = "RADV";
  
  #       Force AMDVLK:

  #         environment.variables.VK_ICD_FILENAMES =
  #           "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";

  # Reference:
  # For more details, the official NixOS manual provides further insights into Vulkan and AMDVLK configuration 
  # on NixOS. (https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel-vulkan)


  # == Testing Vulkan Configuration ==

  # The proper installation of Vulkan drivers can be verified through the vulkaninfo command of the
  # vulkan-tools package.
  
  # Install the vulkan-tools package, which includes vulkaninfo:
  
    #   environment.systemPackages = [ pkgs.vulkan-tools ];

  # This command will report the hardware devices and drivers found, in this example output amdvlk and radv:

  # $ vulkaninfo | grep GPU
  #                 GPU id  : 0 (Unknown AMD GPU)
  #                 GPU id  : 1 (AMD RADV NAVI10 (LLVM 9.0.1))
  #      ...
  # GPU0:
  #         deviceType     = PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
  #         deviceName     = Unknown AMD GPU
  # GPU1:
  #         deviceType     = PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
  
  # If you see your GPU listed and drivers like RADV or AMDVLK, Vulkan is correctly configured.

  # A simple graphical application that uses Vulkan is vkcube from the vulkan-tools package.

}

# == Summary ==

# Vulkan is enabled by default on NixOS with Mesa RADV for 64-bit apps.

# Use hardware.graphics.extraPackages to add Vulkan drivers like AMDVLK.

# Enable 32-bit Vulkan support with hardware.opengl.driSupport32Bit.

# Verify setup with vulkaninfo or simple Vulkan applications like vkcube.

# Optionally, force a specific Vulkan driver (RADV or AMDVLK) via environment variables.