{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (nemo-with-extensions.override {
      extensions = [ nemo-seahorse ];
    })
  ];

  services.dbus.packages = with pkgs; [
    libcryptui
  ];
}