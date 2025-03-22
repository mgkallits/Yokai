{ config, pkgs, ... }:

{
  # Ρύθμιση του SSH
  programs.ssh = {
    enable = true;
    forwardAgent = true;  # Προαιρετικό: Αν θέλετε να χρησιμοποιήσετε SSH agent forwarding
  };

  # Προσθήκη του SSH κλειδιού στο σύστημα
  environment.etc."ssh/ssh_config".text = ''
    Host github.com
      IdentityFile ~/.ssh/id_ed25519
      IdentitiesOnly yes
  '';

  # Εγκατάσταση απαραίτητων πακέτων
  environment.systemPackages = with pkgs; [
    git
    sshpass  # Προαιρετικό: Αν χρειάζεστε SSH password authentication
  ];
}