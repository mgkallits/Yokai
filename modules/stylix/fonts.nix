{ config, pkgs, ... }:

{ 
    stylix.fonts = {
        monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
        };
        sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
        };
        serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
        };
    };

    stylix.fonts.sizes = {
        applications = 12;
        terminal = 14;
        desktop = 10;
        popups = 10;
    };
}