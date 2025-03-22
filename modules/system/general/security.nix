{ config, pkgs, ... }: 

{

  security = {

    # Enable RTKit for real-time priority management, useful for low-latency audio and video applications
    rtkit.enable = true;
    
    # Enable Polkit (PolicyKit) for managing system-wide policies and permissions
    polkit = {
      enable = true;
      package = pkgs.polkit;
      # Custom Polkit configuration to allow certain actions for users in the "users" group:
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (
            subject.isInGroup("users")
              && (
                action.id == "org.freedesktop.login1.reboot" ||
                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
                action.id == "org.freedesktop.login1.power-off" ||
                action.id == "org.freedesktop.login1.power-off-multiple-sessions"
              )
            )
          {
            return polkit.Result.YES;
          }
        });
      '';
    };

    # sudo = {
    #   enable = true;
    #   extraRules = [
    #     {
    #       commands = [
    #         {
    #           command = "${pkgs.systemd}/bin/reboot";
    #           options = [ "NOPASSWD" ];
    #         }
    #         {
    #           command = "${pkgs.systemd}/bin/poweroff";
    #           options = [ "NOPASSWD" ];
    #         }
    #         {
    #           command = "${pkgs.systemd}/bin/shutdown";
    #           options = [ "NOPASSWD" ];
    #         }
    #       ];
    #       groups = [ "wheel" ];
    #     }
    #   ];
    # };

  };

  environment.systemPackages = [ pkgs.hyprpolkitagent ];   

}
