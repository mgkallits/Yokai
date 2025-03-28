{ config, pkgs, ... }: 

{
    # home.packages = with pkgs; [ pkgs.sxhkd ];

    services.sxhkd.enable = false;
    services.sxhkd.package = pkgs.sxhkd;

    services.sxhkd.keybindings = {
        "alt + {p,s,r,q,j,b,t,w}" = "brave --app=https://{portainer,sonarr,radarr,qbittorrent,jellyfin,prowlarr,traefik-dashboard,whoami}.mgkallits.xyz";
        "alt + h" = "brave --app=https://pihole.mgkallits.xyz/admin/login.php";
        "alt + shift + {p,h,j}" = "brave --app={https://192.168.1.160:9443/#!/home,http://192.168.1.160:82/admin/login.php,http://localhost:8096}";
        "alt + g" = "brave --app=https://chatgpt.com";
    };
}