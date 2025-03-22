{config, pkgs, lib, display-manager, ... }:

{

  config = lib.mkIf (display-manager == "startx") {
    
    xsession.enable = true;
    
    # xsession.initExtra = ''
    #   # xsetroot -cursor_name left_ptr
    #   xset r rate 200 40
    #   xrandr --output DisplayPort-1 --mode 2560x1440 --rate 165
    # '';

    # home.file.".Xresources".text =  ''
      # !/bin/sh

      # Include Pywal colors
      # include ~/.cache/wal/colors.Xresources

      # Set cursor theme and size
      # Xcursor.theme: Notwaita-Black
      # Xcursor.size: 16
    # '';

    home.file.".xprofile".text =  ''
      #!/bin/sh

      # Set display configuration
      xrandr --output DisplayPort-1 --mode 2560x1440 --rate 165

      xset r rate 200 40

      # xsetroot -cursor_name left_ptr

      # Apply the last pywal color scheme
      wal -R

      # Load the updated X resources
      # xrdb merge ~/.Xresources

      # Start OpenRGB and load the "profile" profile in the background
      openrgb -p "profile" &

      # Start additional applications in the background
      picom -f &        # Picom compositor
      slstatus &        # Status bar (uncomment if needed)

      # Set wallpaper in the background
      feh --bg-scale ~/Pictures/waves-minimal-4k-ay-2560x1440.jpg &
    '';

    home.file.".xinitrc".source = ''
      #!/bin/sh

      # Make sure this is before the 'exec' command or it won't be sourced.
      [ -f /etc/xprofile ] && . /etc/xprofile
      [ -f ~/.xprofile ] && . ~/.xprofile

      # xrdb ~/.Xresources

      # xsetroot -cursor_name left_ptr

      # Start DWM
      exec dwm
    '';
    
  };

}