{
  config,
  pkgs,
  lib,
  hostname,
  username,
  ...
}:

{
  config = lib.mkIf (hostname == "tanuki") {
    boot.kernelParams = [ "snd_hda_intel.power_save=0" ];

    # sound.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true; # Enable ALSA support for PipeWire
      alsa.support32Bit = true;
      pulse.enable = true; # Enable PulseAudio compatibility
      wireplumber = {
        enable = true; # Enable WirePlumber for PipeWire session management

        configPackages = [
          (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-mic-timeout.lua" ''
            -- Close microphone streams after 5 seconds of inactivity
            alsa_monitor.rules = {
              {
                matches = {
                  { "node.name", "matches", "alsa_input.*" },
                };
                apply_properties = {
                  ["session.suspend-timeout-seconds"] = 5, -- Close after 5 seconds of inactivity
                },
              },
            }
          '')
        ];
        #       configPackages = [
        #         (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-disable-auto-switch.lua" ''
        #           -- Disable automatic switching to newly connected devices
        #           default_access.rules = {
        #             {
        #               matches = {
        #                 { "device.name", "matches", "alsa_output.*" },
        #               };
        #               apply_properties = {
        #                 ["device.profile"] = "off", -- Disable automatic profile switching
        #               },
        #             },
        #           }
        #         '')
        #
        #        (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-alsa-pro-audio.lua" ''
        #           alsa_monitor.rules = {
        #             {
        #               matches = {
        #                 { "node.name", "equals", "alsa_output.pci-0000_0c_00.4.pro-output-0" },
        #               };
        #               apply_properties = {
        #                 ["audio.format"] = "S32LE",          # Use 32-bit audio format
        #                 ["audio.rate"] = 96000,               # Sample rate (96 kHz)
        #                 ["api.alsa.period-size"] = 128,       # Period size (tweak for low latency)
        #                 -- ["api.alsa.disable-batch"] = true, # Disable batch mode for USB soundcards
        #               },
        #             },
        #             {
        #               matches = {
        #                 { "node.name", "equals", "alsa_input.pci-0000_0c_00.4.pro-input-0" },
        #               };
        #               apply_properties = {
        #                 ["audio.format"] = "S32LE",          # Use 32-bit audio format
        #                 ["audio.rate"] = 96000,               # Sample rate (96 kHz)
        #                 ["api.alsa.period-size"] = 128,       # Period size (tweak for low latency)
        #                 -- ["api.alsa.disable-batch"] = true, # Disable batch mode for USB soundcards
        #               },
        #             },
        #             {
        #               matches = {
        #                 { "node.name", "equals", "alsa_input.pci-0000_0c_00.4.pro-input-2" },
        #               };
        #               apply_properties = {
        #                 ["audio.format"] = "S32LE",          # Use 32-bit audio format
        #                 ["audio.rate"] = 96000,               # Sample rate (96 kHz)
        #                 ["api.alsa.period-size"] = 128,       # Period size (tweak for low latency)
        #                 -- ["api.alsa.disable-batch"] = true, # Disable batch mode for USB soundcards
        #               },
        #             },
        #           }
        #         '')
        #       ];
      };
      jack.enable = true; # Enable JACK support (optional)

      #     extraConfig.pipewire = {
      #       # Downmix 5.1 to 2.1
      #       "94-downmix" = {
      #         "context.properties" = {
      #           "channelmix.upmix" = true;
      #           "channelmix.downmix" = true;
      #           "channelmix.lfe-cutoff" = 150;
      #           "channelmix.fc-cutoff" = 12000;
      #         };
      #       };
      #
      #       # Optimized for music quality
      #       "92-music-quality" = {
      #         "context.properties" = {
      #           "default.clock.rate" = 96000;       # Higher sample rate for better quality
      #           "default.clock.quantum" = 512;      # Larger buffer size for stability
      #           "default.clock.min-quantum" = 512;   # Minimum buffer size
      #           "default.clock.max-quantum" = 1024;  # Maximum buffer size
      #           "default.clock.flush-on-stop" = true; # Clear buffers on stream stop
      #           "resample.quality" = 15;             # Highest resampling quality
      #         };
      #       };
      #
      #       # PulseAudio compatibility buffering
      #       "93-stream-buffering" = {
      #         context.modules = [
      #           {
      #             name = "libpipewire-module-protocol-pulse";
      #             args = {
      #               pulse.min.req = "512/96000";  # Larger buffer size for stability
      #               pulse.default.req = "512/96000"; # Default request size
      #               pulse.max.req = "1024/96000";  # Maximum buffer size
      #               pulse.min.quantum = "512/96000"; # Minimum quantum size
      #               pulse.max.quantum = "1024/96000"; # Maximum quantum size
      #             };
      #           }
      #         ];
      #         stream.properties = {
      #           node.latency = "512/96000"; # Larger buffer size for stability
      #           resample.quality = 15;      # Highest resampling quality
      #         };
      #       };
      #
      #       # Channel layout for 2.1 audio
      #       "95-channel-layout" = {
      #         "context.properties" = {
      #           "default.audio.channels" = 2;
      #           "default.audio.lfe-channel" = true;
      #         };
      #       };
      #
      #       # Real-time scheduling
      #       "93-rtkit" = {
      #         "context.modules" = [
      #           {
      #             name = "libpipewire-module-rtkit";
      #             args = {
      #               "rt.prio"      = 88;           # Real-time priority
      #               "rt.time.soft" = 2000000;      # Soft real-time timeout (2 seconds)
      #               "rt.time.hard" = 2000000;      # Hard real-time timeout (2 seconds)
      #               "nice.level"   = -11;          # Nice level (higher priority)
      #             };
      #             flags = [ "ifexists" "nofail" ]; # Skip if rtkit is not available
      #           }
      #         ];
      #       };
      #     };
    };

    # Add your user to the realtime group
    # users.users."${username}".extraGroups = [ "realtime" ];

    environment.systemPackages = with pkgs; [
      pipewire
      wireplumber
      # easyeffects
    ];

  };

}
