{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.file.".config/doom/".source = config.lib.file.mkOutOfStoreSymlink ./doom;
}
