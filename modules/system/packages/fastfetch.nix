{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.fastfetch
  ];

  # Discripiton: An actively maintained, feature-rich and performance oriented, neofetch like system information tool.
  # Homepage: https://github.com/fastfetch-cli/fastfetch
  # Source: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/fa/fastfetch/package.nix#L155
  # Programs provided: `fastfetch`.
}