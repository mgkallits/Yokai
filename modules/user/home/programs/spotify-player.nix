{ config, pkgs, ... }:

{
  programs.spotify-player = {
    enable = true;

    # Use the latest version of spotify-player
    package = pkgs.spotify-player;

    # General settings
    settings = {
      device = {
        audio_cache = true; # Enable audio caching for smoother playback
        normalization = false; # Disable volume normalization for better dynamic range
      };
      playback = {
        bitrate = 320;
        backend = "pipewire"; # Use PulseAudio (PipeWire's PulseAudio compatibility)
      };
      resample = {
        quality = 10; # Set resampling quality (0 = lowest, 10 = highest)
      };
    };
  };
}