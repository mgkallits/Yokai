{ config, pkgs, ... }:

{

  # What is VA-API?  
  # VA-API (Video Acceleration API) is a library and API specification that allows your system to use
  # your GPU to accelerate video processing tasks, such as decoding and encoding video. This hardware
  # acceleration can significantly improve performance and reduce CPU usage during video playback or
  # transcoding.

  # How VA-API works on NixOS  
  
  #   - Drivers and libva:  
  #     VA-API relies on a driver that matches your GPU. For AMD GPUs, the Mesa stack typically
  #     includes VA-API support, and this is handled by `libva`. The version of `libva` in `nixpkgs`
  #     is preconfigured to look for drivers in the OpenGL driver path.  
  #   - Driver Installation:  
  #     You can enable VA-API for AMD GPUs by adding the necessary drivers via the
  #     `hardware.graphics.extraPackages` option. For AMD GPUs, these are included in the Mesa package,
  #     which is already enabled when `hardware.graphics.enable` is set to `true`.  
  #   - Testing VA-API:  
  #     Once VA-API is installed, you can verify its functionality using the `vainfo` tool. To do this, open a Nix shell and run:  
  #       ```bash
  #         nix-shell -p libva-utils --run vainfo
  #       ```
  #     This command will output details about your GPU and confirm whether VA-API is working.
  
  # Why VA-API is useful for AMD users  
  
  # For AMD users, VA-API is especially helpful for tasks such as:
  #   - Watching videos on applications like VLC or MPV with reduced CPU usage.
  #   - Using video editing or transcoding software like HandBrake, which can take advantage of hardware
  #     acceleration to speed up rendering or encoding.

  # If you're already using the Mesa stack (enabled by default with `hardware.graphics.enable = true`),
  # VA-API support should work out of the box for AMD GPUs. You just need to verify it using `vainfo`.
    


    # VA-API 
    # VA-API (Video Acceleration API) is an open-source library and API specification, which provides access to graphics hardware acceleration capabilities for video processing.

    # VA-API drivers are loaded by libva. The version in nixpkgs is built to search the opengl driver path, so drivers can be installed in hardware.graphics.extraPackages.

    # VA-API can be tested using:

    # nix-shell -p libva-utils --run vainfo

    # --

    # Hardware Video Acceleration
    # GPUs have built-in hardware for decoding / encoding video. Using this is much more efficient than using the CPU. See also the Arch Wiki.

    # There are two main APIs for video accel on Linux.

    # VA-API
    # Developed by Intel, open spec, FOSS library. Seems to be generally broader supported than VDPAU.

    # Many VA-API drivers are also included in Mesa.

    # For available drivers, see /run/opengl-driver/lib/dri. The file names are {DRIVER_NAME}_drv_video.so.

    # The driver used for VA-API can be overridden with the env var LIBVA_DRIVER_NAME. E.g. for AMD, it's radeonsi.

    # To verify VA-API support and view supported codecs: nix shell nixpkgs#libva-utils -c vainfo

    # VDPAU
    # Authored by Nvidia, developed by freedesktop.org, open spec, FOSS library.

    # Many VDPAU drivers are also included in Mesa.

    # For available drivers, see /run/opengl-driver/lib/vdpau. The file names are libvdpau_{DRIVER_NAME}.so.

    # The driver used for VDPAU can be overridden with the env var VDPAU_DRIVER. E.g. for AMD, it's radeonsi.

    # To verify VDPAU support and view supported codecs: nix shell nixpkgs#vdpauinfo -c vdpauinfo

    # Note that VDPAU will not be able to detect the correct drive to use in most Wayland enviroments, as there is no DRI2 support. The driver will always fall back to nvidia if it wasn't set using VDPAU_DRIVER.[1]

    # See also
    # The Arch Wiki has good articles on a lot of these topics, which are linked above.
    # writeup about setting up graphics in Eisfunke's NixOS config repo (this article was originally based on that)
    # ↑ [1]
    # ---



    # == Problems ==
    # Dual Monitors
    # If you encounter problems having multiple monitors connected to your GPU, adding `video` parameters for each connector to the kernel command line sometimes helps.

    # For example:

    # boot.kernelParams = [
    #   "video=DP-1:2560x1440@144"
    #   "video=DP-2:2560x1440@144"
    # ];
    # With the connector names (like `DP-1`), the resolution and frame rate adjusted accordingly.

    # To figure out the connector names, execute the following command while your monitors are connected:

    # head /sys/class/drm/*/status


}