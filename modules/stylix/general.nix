{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  # Enable Stylix service
  stylix.enable = true;
  stylix.polarity = "dark";

  stylix.base16Scheme = ./colors.yaml;

}
