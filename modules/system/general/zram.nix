{ config, pkgs, ... }:

{
  # Enable zram-based swap, which uses compressed RAM instead of a traditional swap partition.
  # This can improve performance on systems with limited RAM by reducing disk swapping.
  zramSwap = {
    enable = true;
    memoryPercent = 100; # Use 100% of RAM for ZRAM (default: 50)
    algorithm = "zstd"; # Better compression (needs kernel ≥5.16)
    # priority = 5; # Lower than disk swap (default: 100)
  };
}
