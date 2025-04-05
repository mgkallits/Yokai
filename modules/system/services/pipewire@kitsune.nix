{
  config,
  pkgs,
  lib,
  hostname,
  username,
  ...
}:

{
  config = lib.mkIf (hostname == "kitsune") {
    # Disable power saving for the audio device to prevent audio glitches
    boot.kernelParams = [ "snd_hda_intel.power_save=0" ];

    # Enable PipeWire and its components
    services.pipewire = {
      enable = true;
      alsa.enable = true; # Enable ALSA support for PipeWire
      alsa.support32Bit = true; # Support 32-bit applications
      pulse.enable = true; # Enable PulseAudio compatibility
      jack.enable = true; # Enable JACK support (optional)

      # Configure WirePlumber for session management
      wireplumber = {
        enable = true;
        configPackages = [
          (pkgs.writeTextDir "share/wireplumber/main.lua.d/93-alsa-audio.lua" ''
            alsa_monitor.rules = {
              {
                matches = {
                  { "node.name", "equals", "alsa_output.pci-0000_0c_00.4.analog-stereo" },
                };
                apply_properties = {
                  ["audio.format"] = "S32LE",          # Use 32-bit audio format
                  ["audio.rate"] = 96000,              # Sample rate (96 kHz)
                  ["api.alsa.period-size"] = 128,      # Period size for low latency
                  ["api.alsa.headroom"] = 1024,        # Headroom for stability
                },
              },
              {
                matches = {
                  { "node.name", "equals", "alsa_input.pci-0000_0c_00.4.analog-stereo" },
                };
                apply_properties = {
                  ["audio.format"] = "S32LE",          # Use 32-bit audio format
                  ["audio.rate"] = 96000,              # Sample rate (96 kHz)
                  ["api.alsa.period-size"] = 128,      # Period size for low latency
                  ["api.alsa.headroom"] = 1024,        # Headroom for stability
                },
              },
            }
          '')
        ];
      };

      # Extra PipeWire configuration for music quality
      extraConfig.pipewire = {

        # Optimized for music quality
        "92-music-quality" = {
          "context.properties" = {
            "default.clock.rate" = 96000; # Sample rate (96 kHz)
            "default.clock.allowed-rates" = [
              44100
              48000
              88200
              96000
              176400
              192000
            ];
            "default.clock.quantum" = 512; # Buffer size (512 frames)
            "default.clock.min-quantum" = 512; # Minimum buffer size
            "default.clock.max-quantum" = 1024; # Maximum buffer size
            "default.clock.flush-on-stop" = true;
            "resample.quality" = 15; # Highest resampling quality
          };
        };

        # PulseAudio compatibility buffering
        "93-stream-buffering" = {
          context.modules = [
            {
              name = "libpipewire-module-protocol-pulse";
              args = {
                pulse.min.req = "512/96000"; # Larger buffer size for stability
                pulse.default.req = "512/96000";
                pulse.max.req = "1024/96000";
                pulse.min.quantum = "512/96000";
                pulse.max.quantum = "1024/96000";
              };
            }
          ];
          stream.properties = {
            node.latency = "512/96000"; # Larger buffer size for stability
            resample.quality = 15; # Highest resampling quality
          };
        };

        # Real-time scheduling
        "93-rtkit" = {
          "context.modules" = [
            {
              name = "libpipewire-module-rtkit";
              args = {
                "rt.prio" = 88; # Real-time priority
                "rt.time.soft" = 2000000; # Soft real-time timeout (2 seconds)
                "rt.time.hard" = 2000000; # Hard real-time timeout (2 seconds)
                "nice.level" = -11; # Nice level (higher priority)
              };
              flags = [
                "ifexists"
                "nofail"
              ]; # Skip if rtkit is not available
            }
          ];
        };
      };
    };

    # Disable suspend of Toslink output to prevent audio popping
    services.pipewire.wireplumber.extraConfig."99-disable-suspend" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {
              "node.name" = "alsa_output.pci-0000_0c_00.4.analog-stereo";
            }
          ];
          actions = {
            update-props = {
              "session.suspend-timeout-seconds" = 0; # Disable suspend timeout
            };
          };
        }
      ];
    };

    # Add your user to the realtime group for better scheduling
    users.users."${username}".extraGroups = [ "realtime" ];

    # Install necessary audio packages
    environment.systemPackages = with pkgs; [
      pipewire
      alsa-utils
      alsa-plugins
      wireplumber
      alsa-lib
      easyeffects # For advanced audio effects and equalization
    ];
  };

}

# ---
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$ la
# total 24
# drwxr-xr-x 2 mgkallits users 4096 Mar 16 18:54 .
# drwxr-xr-x 3 mgkallits users 4096 Mar  4 00:20 ..
# -rw-r--r-- 1 mgkallits users  140 Mar 16 18:50 90-downmix
# -rw-r--r-- 1 mgkallits users  214 Mar 16 18:54 92-music-quality
# -rw-r--r-- 1 mgkallits users  606 Mar  4 00:23 echo-cancel.conf
# -rw-r--r-- 1 mgkallits users  209 Mar  4 00:23 upmixing.conf
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$ cat 92-music-quality
# context.properties = {
#   default.clock.rate = 96000
#   default.clock.quantum = 512
#   default.clock.min-quantum = 512
#   default.clock.max-quantum = 1024
#   default.clock.flush-on-stop = true
#   resample.quality = 15
# }
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$ cat echo-cancel.conf
# # Enable echo cancelation
# context.modules = [
#   {   name = libpipewire-module-echo-cancel
#       args = {
#           # library.name  = aec/libspa-aec-webrtc
#           # node.latency = 1024/48000
#           # monitor.mode = false
#           capture.props = {
#              node.name = "Echo Cancellation Capture"
#           }
#           source.props = {
#              node.name = "Echo Cancellation Source"
#           }
#           sink.props = {
#              node.name = "Echo Cancellation Sink"
#           }
#           playback.props = {
#              node.name = "Echo Cancellation Playback"
#           }
#       }
#   }
# ]
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$ cat upmixing.conf
# # Enables upmixing
# stream.properties = {
#     channelmix.upmix      = true
#     channelmix.upmix-method = psd
#     channelmix.lfe-cutoff = 150
#     channelmix.fc-cutoff  = 12000
#     channelmix.rear-delay = 12.0
# }
# [mgkallits@kitsune ~/.config/pipewire/pipewire-pulse.conf.d]$
