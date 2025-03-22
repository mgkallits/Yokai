{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

# let
#   # Define the custom Emacs derivation using use-package integration
#   my-emacs = pkgs.emacsWithPackagesFromUsePackage {
#     config = ./config.org;  # Path to your Emacs config file
#     defaultInitFile = true;  # Use the config as the default init file
#     package = (pkgs.emacsPackagesFor (pkgs.emacs.overrideAttrs (old: {
#       configureFlags = old.configureFlags ++ [
#         "--with-pgtk"
#         "--with-native-compilation"
#         "--with-json"
#         "--with-tree-sitter"
#         "--with-modules"
#         "--with-xwidgets"
#         "--with-mailutils"
#         "--with-cairo"
#         "--with-harfbuzz"
#         "--with-imagemagick"
#       ];
#     }))).emacsWithPackages (epkgs: [
#       epkgs.treesit-grammars.with-all-grammars
#       epkgs.vterm
#       # epkgs.mu4e  # Uncomment if needed
#     ]);
#     alwaysEnsure = true;  # Ensure all use-package references are installed
#     alwaysTangle = true;  # Tangle all Org babel blocks
#     extraEmacsPackages = epkgs: [
#       epkgs.cask
#       pkgs.shellcheck
#     ];
#   };

#   let
#     doomemacs = inputs.doom-emacs;
#     emacs = with pkgs; (emacsPackagesFor emacs-unstable-pgtk) .emacsWithPackages (
#       epkgs: with epkgs;
#       [
#         treesit-grammars.with-all-grammars
#         vterm
#         # mu4e
#       ]);
#   in

#   emacs = with pkgs; (emacsPackagesFor emacs-unstable-pgtk) .emacsWithPackages (
#     epkgs: with epkgs;
#     [
#       treesit-grammars.with-all-grammars
#       vterm
#       # mu4e
#     ]);

#     emacs = config.programs.emacs.finalPackage;

#     emacs = with pkgs; (emacsPackagesFor emacs-unstable-pgtk) .emacsWithPackages (
#       epkgs: with epkgs;
#       [
#         treesit-grammars.with-all-grammars
#         vterm
#         # mu4e
#       ]);
#       # Environment variables for Doom Emacs
#       doom-envvars = ''
#         export EMACS="${config.home.sessionVariables.EMACS}"
#         export PATH="${config.xdg.configHome}/emacs/bin}:${emacs}/bin:$PATH"
#         export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
#         export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
#       '';
# in

{

  # nixpkgs.overlays = [
  #   inputs.emacs-overlay.overlays.default
  # ];

  # programs.emacs = {
  #   enable = true;
  #   package = emacs;
  # };

  # services.emacs = {
  #   enable = true;
  #   client.enable = true;
  # };

  # xdg.configFile = {
  #   emacs = {
  #     source = inputs.doom-emacs;
  #     onChange = "
  #     ${pkgs.writeShellScript
  #     "doom-emacs_installation__and_synchronization" ''
  #       ${doom-envvars}
  #       if [ ! -d "$DOOMDIR" ]; then
  #       yes | "$EMACS/bin/doom" install
  #       else
  #       "$EMACS/bin/doom" sync
  #       fi
  #     ''}
  #     ";  # Will sync on changes
  #   };
  # };

  # home.packages = with pkgs; [ emacs ];

  # nixpkgs.overlays = [ inputs.emacs-overlay.overlays.default ];

  # programs.emacs = {
  #   enable = true;
  #   package = my-emacs;  # Use the custom Emacs derivation
  # };

  # services.emacs = {
  #   enable = true;
  #   client.enable = true;
  # };

  # home = {
  #   # sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];

  #   sessionVariables = with config.xdg; {
  #     EMACS = "${config.xdg.configHome}/emacs";
  #     DOOMDIR = "${config.xdg.configHome}/doom";
  #     DOOMLOCALDIR = "${config.xdg.dataHome}/doom";

  #     ALTERNATE_EDITOR = "";
  #     EDITOR = "emacsclient --tty --quiet"; # $EDITOR opens in terminal
  #     VISUAL = "emacsclient --create-frame --alternate-editor=emacs --quiet"; # $VISUAL opens in GUI mode
  #   };
  # };

  # xdg.configFile = {
  #   emacs = {
  #     source = inputs.doom-emacs;
  #     onChange = "${pkgs.writeShellScript "doom-change" ''
  #       ${doomScriptEnvVars}
  #       #       if [ ! -d "$EMACS" ]; then
  #       yes | doom install
  #       else
  #       doom sync
  #       fi
  #     ''}";  # Will sync on changes
  #   };

  #   "doom/init.el" = {
  #     source = pkgs.substituteAll {
  #       src = ./init.el;
  #       exec-path = pkgs.buildEnv {
  #         name = "doom-emacs-deps";
  #         pathsToLink = [ "/bin" ];
  #         paths = map lib.getBin (
  #           with pkgs; [
  #             git
  #             ripgrep
  #             gnutls
  #             fd
  #           ]
  #         );
  #       };
  #     };
  #     onChange = "${pkgs.writeShellScript "doom-config-init-change" ''
  #       ${doomScriptEnvVars}
  #       #       doom sync
  #     ''}";
  #   };

  #   "doom/config.el" = {
  #     source = pkgs.substituteAll {
  #       src = ./config.el;
  #       DOOMLOCALDIR = config.home.sessionVariables.DOOMLOCALDIR;
  #     };
  #     onChange = "${pkgs.writeShellScript "doom-config-packages-change" ''
  #       ${doomScriptEnvVars}
  #       #       doom sync
  #     ''}";
  #   };

  #   "doom/packages.el".source = ./packages.el;
  # };

  # home.packages = with pkgs; [
  #   ## Emacs itself
  #   binutils  # native-comp needs 'as', provided by this
  #   emacs-pgtk  # HEAD + native-comp

  #   ## Doom dependencies
  #   git
  #   ripgrep
  #   gnutls  # for TLS connectivity

  #   ## Optional dependencies
  #   fd  # faster projectile indexing
  #   imagemagick  # for image-dired
  #   pinentry-emacs  # in-emacs gnupg prompts
  #   zstd  # for undo-fu-session/undo-tree compression

  #   ## Module dependencies
  #   # :email mu4e
  #   # mu
  #   # isync
  #   # :checkers spell
  #   (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
  #   # :tools editorconfig
  #   editorconfig-core-c  # per-project style config
  #   # :tools lookup & :lang org +roam
  #   sqlite
  #   # :lang cc
  #   clang-tools
  #   # :lang latex & :lang org (latex previews)
  #   texlive.combined.scheme-medium
  #   # :lang beancount
  #   beancount
  #   fava
  #   # :lang nix
  #   age
  #   nil  # LSP
  #   # ---
  #   cmake gnumake  # The vterm module requires cmake and make to compile
  #   nodejs  # The lsp-mode package requires npm to install language servers
  #   pandoc  # The markdown-preview feature requires a markdown compiler
  #   shfmt shellcheck  # The sh module requires shfmt and shellcheck

  #   # Fonts
  #   emacs-all-the-icons-fonts
  #   nerd-fonts.symbols-only
  # ];
}
