{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (octaveFull.withPackages (
      opkgs: with opkgs; [
        statistics
      ]
    ))
  ];
}
