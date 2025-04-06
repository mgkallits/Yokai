{ config, pkgs, ... }:

{
  services.power-profiles-daemon.enable = true;

  # See: https://gitlab.freedesktop.org/upower/power-profiles-daemon

  # [mgkallits@kitsune ~]$ powerprofilesctl -h
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...

  # positional arguments:
  #   {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                         Individual command help
  #     list                List available power profiles
  #     list-holds          List current power profile holds
  #     list-actions        List available power profile actions
  #     get                 Print the currently active power profile
  #     set                 Set the currently active power profile
  #     configure-action    Configure the action to be taken for the profile
  #     configure-battery-aware
  #                         Turn on or off dynamic changes from battery level or power adapter
  #     query-battery-aware
  #                         Query if dynamic changes from battery level or power adapter are enabled
  #     launch              Launch a command while holding a power profile
  #     version             Print version information and exit

  # options:
  #   -h, --help            show this help message and exit

  # Use “powerprofilesctl COMMAND --help” to get detailed help for individual commands
  # [mgkallits@kitsune ~]$ powerprofilesctl list
  # * performance:
  #     CpuDriver:	amd_pstate
  #     Degraded:   no

  #   balanced:
  #     CpuDriver:	amd_pstate
  #     PlatformDriver:	placeholder

  #   power-saver:
  #     CpuDriver:	amd_pstate
  #     PlatformDriver:	placeholder
  # [mgkallits@kitsune ~]$ powerprofilesctl list-actions
  # Name: trickle_charge
  # Description: Configure power supply to trickle charge
  # Enabled: True

  # Name: amdgpu_panel_power
  # Description: Panel Power Savings (may affect color quality)
  # Enabled: False

  # Name: amdgpu_dpm
  # Description: Adjust GPU dynamic power management
  # Enabled: False
  # [mgkallits@kitsune ~]$ powerprofilesctl query-battery-aware
  # Dynamic changes from charger and battery events: True
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware
  # Error: enable or disable is required
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware disable
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...
  # .powerprofilesctl-wrapped: error: unrecognized arguments: disable
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware-disable
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...
  # .powerprofilesctl-wrapped: error: argument command: invalid choice: 'configure-battery-aware-disable' (choose from list, list-holds, list-actions, get, set, configure-action, configure-battery-aware, query-battery-aware, launch, version)
  # [mgkallits@kitsune ~]$ powerprofilesctl disable configure-battery-aware
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...
  # .powerprofilesctl-wrapped: error: argument command: invalid choice: 'disable' (choose from list, list-holds, list-actions, get, set, configure-action, configure-battery-aware, query-battery-aware, launch, version)
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware off
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...
  # .powerprofilesctl-wrapped: error: unrecognized arguments: off
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware -h
  # usage: .powerprofilesctl-wrapped configure-battery-aware [-h] [--enable] [--disable]

  # options:
  #   -h, --help  show this help message and exit
  #   --enable    enable battery aware
  #   --disable   disable battery aware
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware --disavle
  # usage: .powerprofilesctl-wrapped [-h]
  #                                  {list,list-holds,list-actions,get,set,configure-action,configure-battery-aware,query-battery-aware,launch,version}
  #                                  ...
  # .powerprofilesctl-wrapped: error: unrecognized arguments: --disavle
  # [mgkallits@kitsune ~]$ powerprofilesctl configure-battery-aware --disable
  # [mgkallits@kitsune ~]$ powerprofilesctl set -h
  # usage: .powerprofilesctl-wrapped set [-h] {power-saver,balanced,performance}

  # positional arguments:
  #   {power-saver,balanced,performance}
  #                         Profile to use for set command

  # options:
  #   -h, --help            show this help message and exit
  # [mgkallits@kitsune ~]$ powerprofilesctl set power-saver
  # [mgkallits@kitsune ~]$ powerprofilesctl list-holds
  # [mgkallits@kitsune ~]$ powerprofilesctl get
  # power-saver
  # [mgkallits@kitsune ~]$

}
