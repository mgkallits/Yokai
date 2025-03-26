{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.appimage = {
    enable = true;
    binfmt = true; # Optional: Enables seamless execution of AppImages
  };
}
