{ pkgs, username, ... }:

{

  environment.systemPackages = with pkgs; [
    # jellyfin
    # jellyfin-web
    # jellyfin-ffmpeg
    # jellyfin-media-player
  ];

  # Allow Jellyfin to read external drives
  services.jellyfin = {
    enable = false;
    openFirewall = true;
    user = "${username}"; 
    # IMPORTANT: dont forget to run sudo chown -R /var/lib/jellyfin in order to allow it to
    # see external drives mounted
  };

  # === Acceleration for jellyfin ===
  # Enable vaapi on 

}