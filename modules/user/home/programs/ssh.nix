{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes"; # Add keys to ssh-agent automatically
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519"; # Path to your private key
      };
    };
  };
}
