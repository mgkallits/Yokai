{ config, pkgs, ... } :

{
  services.gvfs = { enable = true; }; # Mount, trash, and other functionalities
}