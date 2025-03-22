{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = (with pkgs.nerd-fonts; [
      jetbrains-mono
      caskaydia-mono # used the Font Name not the Original Font Name and Repository !!
      comic-shanns-mono
      commit-mono
    ]) ++ (with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      material-icons
      font-awesome
      atkinson-hyperlegible
      roboto
      newcomputermodern # Doom Emacs
    ]);
  };
}