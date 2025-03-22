{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.appimage = {
    enable = false;
    binfmt = false; # Optional: Enables seamless execution of AppImages
  };
}
