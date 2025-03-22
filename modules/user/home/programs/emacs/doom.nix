{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

# let
#   emacs = config.programs.emacs.finalPackage;
#   doomScriptEnvVars = ''
#     export PATH="${config.xdg.configHome}/doom-emacs/bin/:${emacs}/bin:$PATH"
#     export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
#     export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
#     # export LSP_USE_PLISTS=true
#   '';
# in
{
  # xdg.configFile = {
  #   doom-emacs = {
  #     source = inputs.doomemacs;
  #     onChange = "${pkgs.writeShellScript "doom-change" ''
  #       ${doomScriptEnvVars}
  #       #         if [ ! -d "$DOOMLOCALDIR" ]; then
  #       doom --force install
  #       else
  #       doom --force sync -u
  #       fi
  #     ''}";
  #   };
  #   "doom/init.el" = {
  #     source = pkgs.replaceVars ./doom/init.el {
  #       exec-path = pkgs.buildEnv {
  #         name = "doom-emacs-deps";
  #         pathsToLink = [ "/bin" ];
  #         paths = map lib.getBin (
  #           with pkgs;
  #           [
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
  #       #         doom --force sync
  #     ''}";
  #   };
  #   "doom/config.el" = {
  #     source = pkgs.replaceVars ./doom/config.el {
  #       inherit (config.home.sessionVariables) DOOMLOCALDIR XDG_DOCUMENTS_DIR XDG_DATA_HOME;
  #     };
  #     onChange = "${pkgs.writeShellScript "doom-config-packages-change" ''
  #       ${doomScriptEnvVars}
  #       #         doom --force sync -u
  #     ''}";
  #   };
  #   "doom/packages.el".source = ./doom/packages.el;
  # };

  # home.packages = with pkgs; [ emacs-all-the-icons-fonts ];
}
