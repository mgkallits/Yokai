{ config, pkgs, ... }:

{

  # Use VS Code extensions without additional configuration
  # source: https://nixos.wiki/wiki/Visual_Studio_Code
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

  # programs.vscode = {
  # enable = true;
  # package = pkgs.vscode.fhs;
  # package = pkgs.vscode;

  # Add user settings for VSCode to use the custom theme
  # userSettings = {
  # "editor.fontFamily": "'JetBrainsMono Nerd Font Mono'",
  # "terminal.integrated.fontFamily": "'JetBrainsMono Nerd Font Mono'",

  # "workbench.colorTheme": "Stylix",
  # "window.autoDetectColorScheme": true,
  # "workbench.iconTheme": "gruvbox-material-icon-theme",
  # // "workbench.colorCustomizations": {
  # //   "terminal.background": "#00000000"
  # // },
  # "files.autoSave": "afterDelay",
  # "explorer.confirmDragAndDrop": false,
  # "editor.fontLigatures": true,
  # "workbench.startupEditor": "none",
  # "editor.minimap.enabled": false,
  # "explorer.confirmDelete": false,

  # "workbench.settings.applyToAllProfiles": [
  #   "editor.fontFamily",
  #   "terminal.integrated.fontFamily",
  #   "workbench.colorTheme",
  #   "workbench.colorCustomizations",
  #   "workbench.iconTheme",
  #   "files.autoSave",
  #   "editor.fontLigatures",
  #   "editor.minimap.enabled",
  #   "explorer.confirmDelete",

  # ],
  # "workbench.colorCustomizations": {
  #   "terminal.background": "#00000000"
  # }
  # };

  # stylix.targets.vscode.enable = false;

  # Adding extension-specific dependencies, these will be added to the FHS environment:
  # needed for rust lang server and rust-analyzer extension
  # programs.vscode.package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);

}
