{
  config,
  pkgs,
  version,
  ...
}:

{
  # == System State Version ==

  # *IMPORTANT* -> Don't change after initial install!
  system = {
    stateVersion = "${version}";
    # Set to your initial setup version (meaning curent stable release 
    # vesrion on nixpkgs), through settings.nix.
  };
  
}
