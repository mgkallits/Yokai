{
  config,
  pkgs,
  inputs,
  lib,
  system,
  doomemacs,
  ...
}:

let
  myemacs =
    with pkgs;
    (emacsPackagesFor emacs-unstable-pgtk).emacsWithPackages (
      epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
        vterm
        # mu4e
      ]
    );
in
{
  config = lib.mkIf (doomemacs == true) {

    nixpkgs.overlays = [
      inputs.emacs-overlay.overlays.default
    ];

    #-
    services.emacs.enable = true;
    services.emacs.package = myemacs;

    system.userActivationScripts = {
      # Installation Script on Rebuild
      doom = {
        text = ''
          source ${config.system.build.setEnvironment}

          EMACS="$HOME/.config/emacs"
          PATH="$HOME/.config/emacs/bin:${myemacs}/bin:$PATH"
          DOOMDIR="$HOME/.config/doom"
          DOOMLOCALDIR="$HOME/.local/share/doom"
          if [ ! -d "$EMACS" ]; then
            mkdir ~/.config/emacs
            ${pkgs.git}/bin/git clone --depth 1 https://github.com/hlissner/doom-emacs.git $EMACS
            yes | "$EMACS/bin/doom" install
          else
            "$EMACS/bin/doom" sync
          fi
        ''; # Will Sync on Changes
      };
    };

    # programs.zsh = {
    #   enable = true;
    #   shellInit = ''
    #     export PATH="$HOME/.config/emacs/bin:$PATH"
    #   '';
    # };

    # environment.systemPackages = with pkgs; [
    #   clang
    #   coreutils
    #   emacs-pgtk
    #   fd
    #   git
    #   ripgrep
    #   python313Packages.cmake
    #   sqlite
    #   # gtk3
    # ];
    #-

    environment.systemPackages = with pkgs; [

      ## Emacs itself
      binutils # native-comp needs 'as', provided by this
      myemacs # HEAD + native-comp

      ## Doom dependencies
      git
      ripgrep
      gnutls # for TLS connectivity

      ## Optional dependencies
      fd # faster projectile indexing
      imagemagick # for image-dired
      pinentry-emacs # in-emacs gnupg prompts
      zstd # for undo-fu-session/undo-tree compression

      ## Module dependencies
      # :email mu4e
      # mu
      # isync
      # :checkers spell
      (aspellWithDicts (
        ds: with ds; [
          en
          en-computers
          en-science
        ]
      ))
      # :tools editorconfig
      editorconfig-core-c # per-project style config
      # :tools lookup & :lang org +roam
      sqlite
      # :lang cc
      clang-tools
      # :lang latex & :lang org (latex previews)
      texlive.combined.scheme-medium
      # :lang beancount
      beancount
      # fava
      # :lang nix
      age
      nil # LSP
      # ---
      cmake
      gnumake # The vterm module requires cmake and make to compile. These tools are missing on your system.
      nodejs # The lsp-mode package requires npm to install language servers automatically.
      pandoc # The markdown-preview feature requires a markdown compiler (e.g., pandoc or markdown).
      shfmt
      shellcheck # The sh module requires shfmt for code formatting and shellcheck for linting.
    ];

    #-
    # environment.variables.PATH = [ "$XDG_CONFIG_HOME/emacs/bin" ];
    # modules.shell.zsh.rcFiles = [ "${hey.configDir}/emacs/aliases.zsh" ];
    #-

    fonts.packages = [
      pkgs.nerd-fonts.symbols-only
    ];
  };
}
