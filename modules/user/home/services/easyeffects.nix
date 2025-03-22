{ config, pkgs, ... }:

{

  services.easyeffects = {
    enable = true; # NOTE: programs.dconf.enable NixOS option must be enabled.
    package = pkgs.easyeffects;
    # preset = ''
    #     {
    #         "output": {
    #             "autogain#1": {
    #                 "bypass": true,
    #                 "input-gain": 0.0,
    #                 "maximum-history": 6,
    #                 "reference": "Geometric Mean (MSI)",
    #                 "silence-threshold": -70.0,
    #                 "target": -14.0
    #             },
    #             "bass_enhancer#0": {
    #                 "amount": 3.500000000000002,
    #                 "blend": -2.0,
    #                 "bypass": false,
    #                 "floor": 20.0,
    #                 "floor-active": true,
    #                 "harmonics": 4.500000000000014,
    #                 "input-gain": 0.0,
    #                 "output-gain": -0.5,
    #                 "scope": 65.0
    #             },
    #             "blocklist": [],
    #             "compressor#0": {
    #                 "attack": 10.0,
    #                 "boost-amount": 5.0000000000000036,
    #                 "boost-threshold": -72.0,
    #                 "bypass": true,
    #                 "dry": 0.0,
    #                 "hpf-frequency": 10.0,
    #                 "hpf-mode": "off",
    #                 "input-gain": 0.0,
    #                 "knee": -6.0,
    #                 "lpf-frequency": 20000.0,
    #                 "lpf-mode": "off",
    #                 "makeup": 2.0,
    #                 "mode": "Downward",
    #                 "output-gain": 2.9,
    #                 "ratio": 4.0,
    #                 "release": 100.0,
    #                 "release-threshold": -30.0,
    #                 "sidechain": {
    #                     "lookahead": 0.0,
    #                     "mode": "RMS",
    #                     "preamp": 0.0,
    #                     "reactivity": 10.0,
    #                     "source": "Middle",
    #                     "stereo-split-source": "Left/Right",
    #                     "type": "Feed-forward"
    #                 },
    #                 "stereo-split": false,
    #                 "threshold": -40.0,
    #                 "wet": 2.0
    #             },
    #             "crystalizer#0": {
    #                 "band0": {
    #                     "bypass": false,
    #                     "intensity": -4.0,
    #                     "mute": false
    #                 },
    #                 "band1": {
    #                     "bypass": false,
    #                     "intensity": -5.0,
    #                     "mute": false
    #                 },
    #                 "band10": {
    #                     "bypass": false,
    #                     "intensity": -3.0,
    #                     "mute": false
    #                 },
    #                 "band11": {
    #                     "bypass": false,
    #                     "intensity": -2.0,
    #                     "mute": false
    #                 },
    #                 "band12": {
    #                     "bypass": false,
    #                     "intensity": -1.0,
    #                     "mute": false
    #                 },
    #                 "band2": {
    #                     "bypass": false,
    #                     "intensity": -6.0,
    #                     "mute": false
    #                 },
    #                 "band3": {
    #                     "bypass": false,
    #                     "intensity": -7.0,
    #                     "mute": false
    #                 },
    #                 "band4": {
    #                     "bypass": false,
    #                     "intensity": -8.0,
    #                     "mute": false
    #                 },
    #                 "band5": {
    #                     "bypass": false,
    #                     "intensity": -8.0,
    #                     "mute": false
    #                 },
    #                 "band6": {
    #                     "bypass": false,
    #                     "intensity": -7.0,
    #                     "mute": false
    #                 },
    #                 "band7": {
    #                     "bypass": false,
    #                     "intensity": -6.0,
    #                     "mute": false
    #                 },
    #                 "band8": {
    #                     "bypass": false,
    #                     "intensity": -5.0,
    #                     "mute": false
    #                 },
    #                 "band9": {
    #                     "bypass": false,
    #                     "intensity": -4.0,
    #                     "mute": false
    #                 },
    #                 "bypass": true,
    #                 "input-gain": 0.0,
    #                 "output-gain": 2.0
    #             },
    #             "equalizer#0": {
    #                 "balance": 0.0,
    #                 "bypass": false,
    #                 "input-gain": -3.0,
    #                 "left": {
    #                     "band0": {
    #                         "frequency": 30.0,
    #                         "gain": 4.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 0.8,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-shelf",
    #                         "width": 4.0
    #                     },
    #                     "band1": {
    #                         "frequency": 80.0,
    #                         "gain": 3.0,
    #                         "mode": "BWC (BT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band2": {
    #                         "frequency": 200.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.5,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band3": {
    #                         "frequency": 500.0,
    #                         "gain": 0.0,
    #                         "mode": "BWC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band4": {
    #                         "frequency": 1000.0,
    #                         "gain": -1.5,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band5": {
    #                         "frequency": 2500.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.5,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band6": {
    #                         "frequency": 5000.0,
    #                         "gain": 4.0,
    #                         "mode": "BWC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band7": {
    #                         "frequency": 10000.0,
    #                         "gain": 3.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Hi-shelf",
    #                         "width": 4.0
    #                     },
    #                     "band8": {
    #                         "frequency": 15000.0,
    #                         "gain": -3.0,
    #                         "mode": "LRX (MT)",
    #                         "mute": false,
    #                         "q": 0.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-pass",
    #                         "width": 4.0
    #                     },
    #                     "band9": {
    #                         "frequency": 20000.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 0.9,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-shelf",
    #                         "width": 4.0
    #                     }
    #                 },
    #                 "mode": "IIR",
    #                 "num-bands": 10,
    #                 "output-gain": 0.0,
    #                 "pitch-left": 0.0,
    #                 "pitch-right": 0.0,
    #                 "right": {
    #                     "band0": {
    #                         "frequency": 30.0,
    #                         "gain": 4.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 0.8,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-shelf",
    #                         "width": 4.0
    #                     },
    #                     "band1": {
    #                         "frequency": 80.0,
    #                         "gain": 3.0,
    #                         "mode": "BWC (BT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band2": {
    #                         "frequency": 200.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.5,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band3": {
    #                         "frequency": 500.0,
    #                         "gain": 0.0,
    #                         "mode": "BWC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band4": {
    #                         "frequency": 1000.0,
    #                         "gain": -1.5,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band5": {
    #                         "frequency": 2500.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.5,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band6": {
    #                         "frequency": 5000.0,
    #                         "gain": 4.0,
    #                         "mode": "BWC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Bell",
    #                         "width": 4.0
    #                     },
    #                     "band7": {
    #                         "frequency": 10000.0,
    #                         "gain": 3.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 1.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Hi-shelf",
    #                         "width": 4.0
    #                     },
    #                     "band8": {
    #                         "frequency": 15000.0,
    #                         "gain": -3.0,
    #                         "mode": "LRX (MT)",
    #                         "mute": false,
    #                         "q": 0.0,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-pass",
    #                         "width": 4.0
    #                     },
    #                     "band9": {
    #                         "frequency": 20000.0,
    #                         "gain": 2.0,
    #                         "mode": "RLC (MT)",
    #                         "mute": false,
    #                         "q": 0.9,
    #                         "slope": "x2",
    #                         "solo": false,
    #                         "type": "Lo-shelf",
    #                         "width": 4.0
    #                     }
    #                 },
    #                 "split-channels": false
    #             },
    #             "exciter#1": {
    #                 "amount": -2.5,
    #                 "blend": 2.0,
    #                 "bypass": false,
    #                 "ceil": 10000.0,
    #                 "ceil-active": false,
    #                 "harmonics": 6.500000000000003,
    #                 "input-gain": -3.5,
    #                 "output-gain": 0.0,
    #                 "scope": 3300.0
    #             },
    #             "expander#0": {
    #                 "attack": 15.0,
    #                 "bypass": false,
    #                 "dry": 0.0,
    #                 "hpf-frequency": 10.0,
    #                 "hpf-mode": "off",
    #                 "input-gain": 0.5,
    #                 "knee": -8.0,
    #                 "lpf-frequency": 20000.0,
    #                 "lpf-mode": "off",
    #                 "makeup": 2.0,
    #                 "mode": "Downward",
    #                 "output-gain": 0.0,
    #                 "ratio": 3.0,
    #                 "release": 200.0,
    #                 "release-threshold": -30.0,
    #                 "sidechain": {
    #                     "lookahead": 0.0,
    #                     "mode": "RMS",
    #                     "preamp": 0.0,
    #                     "reactivity": 10.0,
    #                     "source": "Middle",
    #                     "stereo-split-source": "Left/Right",
    #                     "type": "Internal"
    #                 },
    #                 "stereo-split": false,
    #                 "threshold": -40.0,
    #                 "wet": 2.0
    #             },
    #             "limiter#0": {
    #                 "alr": false,
    #                 "alr-attack": 5.0,
    #                 "alr-knee": 0.0,
    #                 "alr-release": 50.0,
    #                 "attack": 5.0,
    #                 "bypass": true,
    #                 "dithering": "None",
    #                 "external-sidechain": false,
    #                 "gain-boost": true,
    #                 "input-gain": 0.0,
    #                 "lookahead": 10.0,
    #                 "mode": "Herm Thin",
    #                 "output-gain": 0.0,
    #                 "oversampling": "None",
    #                 "release": 20.0,
    #                 "sidechain-preamp": 0.0,
    #                 "stereo-link": 100.0,
    #                 "threshold": -1.0
    #             },
    #             "loudness#0": {
    #                 "bypass": false,
    #                 "clipping": false,
    #                 "clipping-range": 6.0,
    #                 "fft": "8192",
    #                 "input-gain": -3.0,
    #                 "output-gain": 0.0,
    #                 "std": "ISO226-2023",
    #                 "volume": -0.5000000000000003
    #             },
    #             "plugins_order": [
    #                 "compressor#0",
    #                 "equalizer#0",
    #                 "loudness#0",
    #                 "expander#0",
    #                 "exciter#1",
    #                 "bass_enhancer#0",
    #                 "crystalizer#0",
    #                 "limiter#0",
    #                 "reverb#0",
    #                 "autogain#1",
    #                 "stereo_tools#0"
    #             ],
    #             "reverb#0": {
    #                 "amount": -12.0,
    #                 "bass-cut": 300.0,
    #                 "bypass": true,
    #                 "decay-time": 1.5,
    #                 "diffusion": 0.5,
    #                 "dry": 0.0,
    #                 "hf-damp": 5000.0,
    #                 "input-gain": 0.0,
    #                 "output-gain": 0.0,
    #                 "predelay": 0.0,
    #                 "room-size": "Large",
    #                 "treble-cut": 5000.0
    #             },
    #             "stereo_tools#0": {
    #                 "balance-in": 0.0,
    #                 "balance-out": 0.0,
    #                 "bypass": true,
    #                 "delay": 0.0,
    #                 "input-gain": 0.0,
    #                 "middle-level": 0.0,
    #                 "middle-panorama": 0.0,
    #                 "mode": "LR > LR (Stereo Default)",
    #                 "mutel": false,
    #                 "muter": false,
    #                 "output-gain": 0.0,
    #                 "phasel": false,
    #                 "phaser": false,
    #                 "sc-level": 1.0,
    #                 "side-balance": 0.0,
    #                 "side-level": 0.0,
    #                 "softclip": false,
    #                 "stereo-base": 0.0,
    #                 "stereo-phase": 0.0
    #             }
    #         }
    #     }
    # '';
  };
}