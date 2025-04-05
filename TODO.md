add settings to user defined system settings ?

1. Set the hyprland key bindings :
    "alt + {p,s,r,q,j,b,t,w}" = "brave --app=https://{portainer,sonarr,radarr,qbittorrent,jellyfin,prowlarr,traefik-dashboard,whoami}.mgkallits.xyz";
    "alt + h" = "brave --app=https://pihole.mgkallits.xyz/admin/login.php";
    "alt + shift + {p,h,j}" = "brave --app={https://192.168.1.160:9443/#!/home,http://192.168.1.160:82/admin/login.php,http://localhost:8096}";
    "alt + g" = "brave --app=https://chatgpt.com";


- Add mulltiple user deffinitions in the settings.nix, or in the custom-options create username to create a list of usernames (how would that work?).

- Change the hyprland border color script to use the color14
- add the waybar config to the .dotfiles
- add all symlinks to dotfiles
- make different boot config for hosts
- make hyprland & waybar config for hosts
- add hyprlock -> i want to have all the power options for hyprland and a lockscreen

- chnge mic script with the wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED" && echo "Mic is muted" || echo "Mic is unmuted" command

- pin the hyprswitch version...
