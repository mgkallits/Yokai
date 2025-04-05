{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  home.file.".config/doom/".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/user/home/programs/emacs/doom";
}
