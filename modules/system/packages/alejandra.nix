{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  environment.systemPackages = [ inputs.alejandra.defaultPackage.${system} ];
}
