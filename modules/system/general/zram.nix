{ config, pkgs, ... }:

{
    # Enable zram-based swap, which uses compressed RAM instead of a traditional swap partition.
    # This can improve performance on systems with limited RAM by reducing disk swapping.
    zramSwap = { enable = true; };
}
