{ config, pkgs, ... }:

{
  #   environment.systemPackages = with pkgs; [
  #     (chromium.override {
  #       commandLineArgs = [
  #         "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
  #         "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
  #         "--enable-features=UseMultiPlaneFormatForHardwareVideo"
  #         "--ignore-gpu-blocklist"
  #         "--enable-zero-copy"
  #       ];
  #     })
  #   ];
}
