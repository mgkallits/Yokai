{
  config,
  pkgs,
  ...
}:

{
  # == NixPkgs Configuration ==

  # Allow unfree software 
  nixpkgs.config = {
    allowUnfree = true;
  };

}
