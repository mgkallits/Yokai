# How to add different User

## Overview

This system implements dynamic user configurations for NixOS that automatically load based settings defined on `settings.nix`. Key features:

- Automatic Home Manager integration
- Host-specific customization
- Shared base configurations
- Modular design

## Quick Start

Changing the username in settings require changing the file name located in this directory to `<YOUR_USERNAME>@<YOUR_HOSTNAME>.nix` or else the flake wont pickup your user configs.

This allows to define multiple user configs at different or the same host that get automatically loaded depending on the current `settings.nix`.

Currently these configs allow loading a single defined user on a host. (TODO: expand on this.)

## Configuring the `<username>@<hostname.nix>`

The `home/` directory contains the Home Manager configurations and it gets imported through the user config file, make sure to include it if you manipulate the default template! (TODO: create a default user template.)

---
HACK: The naming scheme is made in such a way that when multiple users at different hosts are defined, the desired (single) user configs can be easily toggled through the `settings.nix` file instead of manually changing the config files on all directories. This is usefull when initially installing/reinstalling the flake, because all is needed is:
1. set the `username` and `hostname` in the settings
2. make sure the user config file `<YOUR_USERNAME>@<YOUR_HOSTNAME>.nix` exists in this directory -or simply rename thee existing one-
3. you are good to go!