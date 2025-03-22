{ 
inputs,
config,
lib, ylib,
pkgs,
username,
version,
...
}:



{

  # == General settings ==
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";

    programs.home-manager.enable = true;

    # enables the Fontconfig service
    fonts.fontconfig.enable = true;

    # manage user directories according to the XDG Base Directory Specification
    xdg = {
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

    home.stateVersion = "${version}";
}
