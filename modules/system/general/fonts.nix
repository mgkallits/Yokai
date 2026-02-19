{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages =
      (with pkgs.nerd-fonts; [
        # Primary coding fonts (with Nerd Font symbols)
        # NOTE: used the Font Name not the Original Font Name and Repository !!
        jetbrains-mono
        caskaydia-mono
        comic-shanns-mono
        commit-mono
        fira-code
        symbols-only
      ])
      ++ (with pkgs; [

        source-sans
        source-sans-pro

        # Unicode/Emoji coverage
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        symbola # Critical for ornamental dingbats
        unifont # Last-resort fallback

        # UI/Display fonts
        material-icons
        font-awesome
        atkinson-hyperlegible
        roboto
        newcomputermodern
        et-book
        eb-garamond
        libertinus
        cardo
        vollkorn
        roboto-slab
        alegreya
        garamond-libre
        junicode
        comic-mono
      ]);
  };
}
