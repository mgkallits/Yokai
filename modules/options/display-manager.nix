{ lib, ... }:

with lib;

{
  options = {
    display-manager = mkOption {
      type = types.enum [ "" "gdm" ];
      default = "";
      example = "gdm";
      description = lib.mdDoc ''
        The display manager to enable for graphical login.

        Possible values:
        - `""`: No display manager (console/TTY login only)
        - `"gdm"`: GNOME Display Manager (recommended for GNOME/Wayland)

        When empty (`""`), you'll need to:
        1. Log in via TTY and start your window manager/desktop environment manually
        2. Or configure an autologin TTY that starts your session automatically

        Note: Only one display manager can be enabled at a time.
      '';
      # This makes the option show up in `nixos-option display-manager`
      visible = true;
    };
  };
}