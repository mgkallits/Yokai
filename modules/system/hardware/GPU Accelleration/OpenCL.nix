# OpenCL Configuration in NixOS

# The section explains how to configure OpenCL (Open Computing Language), a general compute API, on NixOS,
# specifically for AMD GPUs through the ROCm (Radeon Open Compute) platform. It is used by various
# applications such as Blender and Darktable to accelerate certain operations.

{ config, pkgs, ... }:

{

  # OpenCL applications load drivers through the Installable Client Driver (ICD) mechanism. In this mechanism,
  # an ICD file specifies the path to the OpenCL driver for a particular GPU family. In NixOS, there are two ways
  # to make ICD files visible to the ICD loader. The first is through the OCL_ICD_VENDORS environment variable.
  # This variable can contain a directory which is scanned by the ICL loader for ICD files. For example:

  #   $ export \
  #     OCL_ICD_VENDORS=`nix-build '<nixpkgs>' --no-out-link -A rocmPackages.clr.icd`/etc/OpenCL/vendors/
  
  # The second mechanism is to add the OpenCL driver package to hardware.graphics.extraPackages. This links the ICD
  # file under /run/opengl-driver, where it will be visible to the ICD loader.
  
  #   ~~AMD Specific~~ 
  #   Modern AMD Graphics Core Next (GCN) GPUs are supported through the rocmPackages.clr.icd
  #   package. Adding this package to hardware.graphics.extraPackages enables OpenCL support:

  hardware.graphics.extraPackages = [ 
    pkgs.rocmPackages.clr.icd
  ]; 

  # What it does?

  #   This line adds an additional package to the hardware.graphics.extraPackages list. This package is 
  #   related to OpenCL, and more specifically, it includes the ICD (Installable Client Driver) for OpenCL 
  #   as part of the ROCm package set (rocmPackages.clr.icd).
  #   1. hardware.graphics.extraPackages:
  #        This option allows you to install extra OpenGL-related packages that are required for proper GPU 
  #        acceleration. In this case, we're adding the icd package from ROCm, which provides the necessary 
  #        OpenCL ICD to enable OpenCL support for AMD GPUs.
  #   2. Why icd is important:
  #        The OpenCL ICD is a crucial component that allows the OpenCL runtime to load the correct driver for 
  #        your GPU. The ROCm OpenCL ICD ensures that your AMD GPU is properly recognized by OpenCL applications.
  
  # What happens when you add this line?

  #   By adding rocmPackages.clr.icd to hardware.graphics.extraPackages, you're ensuring that the OpenCL ICD 
  #   for ROCm is available to the system. This allows applications that rely on OpenCL (like Darktable or 
  #   other GPU-accelerated tools) to use the GPU for computing tasks.
  

  # == Installing clinfo to Verify OpenCL Setup ==
  
  # The proper installation of OpenCL drivers can be verified through the clinfo command of the clinfo package.
  # This command will report the number of hardware devices that is found and give detailed information for
  # each device:

  #   $ clinfo | head -n3
  #   Number of platforms  1
  #   Platform Name        AMD Accelerated Parallel Processing
  #   Platform Vendor      Advanced Micro Devices, Inc.

  environment.systemPackages = with pkgs; [
    clinfo # This will help verify if OpenCL is properly set up
  ];

  # What does it do?

  #   This adds the clinfo package to your system's environment. The clinfo tool is a command-line utility 
  #   that provides detailed information about the OpenCL platform and devices available on your system.

  #     *clinfo Tool*: clinfo queries the system to find all OpenCL platforms and devices. It will output
  #     details about the OpenCL implementation, including which GPUs are available for OpenCL computation,
  #     the supported OpenCL version, and other relevant device information.

  # Why install clinfo?

  #   After installing and configuring OpenCL on your system (in this case, with the ROCm package), clinfo
  #   allows you to verify whether OpenCL is properly set up and whether your GPU is correctly detected as 
  #   an OpenCL device. It's a great diagnostic tool to check if everything is working as expected.



  # == How to Use clinfo ==
  
  # After adding clinfo to your system, you can run the following command to check if OpenCL is working correctly 
  # and whether your AMD GPU is available for OpenCL tasks:

  # $ clinfo

    # Expected Output:
    # If everything is set up correctly, you should see a list of OpenCL platforms and devices. For example, you'll
    # see your AMD GPU listed as a platform with associated device information (e.g., the OpenCL version, available
    # compute units, memory, etc.).

    # Sample Output (Typical for an AMD GPU with ROCm):

    # python
    # Copy
    # Edit
    # Number of platforms                               1
    # Platform Name                                   AMD Accelerated Parallel Processing
    # Platform Vendor                                 Advanced Micro Devices, Inc.
    # Platform Version                                OpenCL 2.1 AMD-APP (3035.5)

    # Platform Profile                                FULL_PROFILE
    # Platform Extensions                             cl_khr_icd cl_amd_event_callback cl_amd_offline_devices

    # ...

    # Platform Name                                   AMD Accelerated Parallel Processing
    # Number of devices                                1
    # Device Name                                     AMD Radeon RX 7900 GRE (RADV NAVI31)
    # Device Type                                     GPU
    # Device Version                                  OpenCL 2.1 AMD-APP (3035.5)
    # ...
    # This will show you the available OpenCL platforms (like the ROCm AMD platform) and the devices (such as your GPU).


  # == Verifying OpenCL in Applications (e.g., Darktable) ==

  # Darktable is an example of a program that uses OpenCL to accelerate image processing tasks. After setting up OpenCL
  # on your system, you can check if it's enabled in Darktable or other similar programs.

  # Optionally, enable OpenCL support in specific applications like Darktable
  # by adding the packages that rely on OpenCL, such as Darktable itself.
  # environment.systemPackages = with pkgs; [
  #   pkgs.darktable  # Example of a program that can use OpenCL for GPU acceleration
  # ];

    # In Darktable:

      # Once OpenCL is properly configured, the program should automatically detect your OpenCL devices 
      # (like the AMD GPU) and use them for computations (e.g., faster image processing).

    # To Check OpenCL in Darktable:

      # Open Darktable and go to its settings or preferences.
      # Look for a section related to performance or OpenCL.
      # If OpenCL is enabled and detected, you should see options related to your OpenCL-capable GPU.

}

# === Summary ===

# hardware.graphics.extraPackages:
# Installs the OpenCL ICD from ROCm (rocmPackages.clr.icd), which is needed for OpenCL to detect and work with your 
# AMD GPU.

# clinfo:
# A command-line tool to check if OpenCL is properly set up and to view the available OpenCL devices on your system.

# By using these configurations, you'll enable OpenCL on NixOS for your AMD GPU and verify that everything works with
# tools like clinfo or GPU-accelerated applications like Darktable.
