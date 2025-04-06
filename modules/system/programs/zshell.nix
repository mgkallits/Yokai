{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    loadInNixShell = true;
    nix-direnv.enable = true;
  };

  # Enabling zsh as the shell of choice

  users.defaultUserShell = pkgs.zsh; # to set a command shell as the default for all users

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    histSize = 10000000;
    histFile = "$HOME/.zsh_history";

    # General settings
    promptInit = ''
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';
    shellInit = ''
      # Spaceship
      # source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
      # autoload -U promptinit; promptinit
      # Load colors
      autoload -U colors && colors
      # Basic auto/tab complete
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      eval "$(zoxide init zsh)"
      # Hook direnv
      #emulate zsh -c "$(direnv hook zsh)"
      #eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      nhs = "nh os switch ~/.dotfiles/.";
      nht = "nh os test ~/.dotfiles/.";
      nhus = "nh os switch ~/.dotfiles/. -u      ";
      gc = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo nix-store --gc";
      ls = "ls -l --color=auto"; # List files in long format with color output
      la = "ls -la --color=auto"; # List all files including hidden ones in long format with color
      lA = "ls -lA --color=auto"; # List all files except '.' and '..' in long format with color
      edit = "sudo -e"; # Edit files with elevated privileges using the default editor
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles/."; # Update and switch to the new NixOS configuration
      # update-all = "sudo nixos-rebuild switch --upgrade";
      gs = "git status --short --decorate --color"; # Show a short and colored status of the Git repository
      gl = "git log --oneline --graph --decorate --color"; # Display a concise and colorful log of commits
      gco = "git checkout"; # Checkout branches or files in Git
      gcm = "git commit -m"; # Commit changes with a message in Git
      gpo = "git push origin"; # Push changes to the origin remote in Git
      gp = "git pull"; # Pull the latest changes from the remote repository
      cd = "z"; # Replace the cd command with zoxide
      # cdi = "zi"; # for zoxide command zi ?
      h = "history"; # Show the command history
      cls = "clear"; # Clear the terminal screen
      # cpy = "xclip -selection clipboard"; # Copy the selected text to the clipboard (requires xclip)
      mkcd = "mkdir -p \$1 && cd \$1"; # Create a directory and change into it in one command
      grep = "grep --color=auto"; # Enable colored output for grep matches
      egrep = "egrep --color=auto"; # Enable colored output for extended grep matches
      fgrep = "fgrep --color=auto"; # Enable colored output for fixed-string grep matches
      #df = "df -h --color=auto"; # Show disk space usage in human-readable format with color
      #du = "du -h --max-depth=1 --color=auto"; # Show disk usage for current directory with color and depth limit
      tree = "tree -C"; # Display directory structure in a tree format with color
      rsync = "rsync -av --progress"; # Archive files with verbose output and progress display
      ping = "ping -c 5"; # Send 5 packets to check network connectivity
      # ssh = "ssh -o ServerAliveInterval=60"; # Keep SSH connections alive
    };
  };

  # programs = {
  #   git.enable = true;

  #   zsh = {
  #     enable = true;
  #     enableCompletion = true;
  #     autosuggestions.enable = true;
  #     syntaxHighlighting.enable = true;
  #     ohMyZsh = {
  #       enable = true;
  #       plugins = [
  #         "git"
  #         "history"
  #         "sudo"
  #       ];
  #     };
  #     promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  #   };

  # };

  # Enabling zsh as the shell of choice
  # programs.zsh.enable = true;
  # # users.dfaultUserShell = pkgs.zsh; # to set a command shell as the default for all users

  # programs.zsh = {
  #   # General settings
  #   # promptInit = ''
  #   #   PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
  #   # '';
  #   # enableCompletion = true;
  #   autosuggestion.enable = true;
  #   enableCompletion = true;
  #   syntaxHighlighting.enable = true;

  #   # Adding custom completion settings
  #   # initExtraFirst = ''
  #   #   PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
  #     # Load colors
  #   #   autoload -U colors && colors
  #     # Basic auto/tab complete
  #   #   autoload -U compinit
  #   #  zstyle ':completion:*' menu select
  #    #  zmodload zsh/complist
  #    #  compinit
  #   #  '';

  #   shellAliases = {
  #     ls = "ls -l --color=auto"; # List files in long format with color output
  #     la = "ls -la --color=auto"; # List all files including hidden ones in long format with color
  #     lA = "ls -lA --color=auto";  # List all files except '.' and '..' in long format with color
  #     edit = "sudo -e"; # Edit files with elevated privileges using the default editor
  #     update = "sudo nixos-rebuild switch"; # Update and switch to the new NixOS configuration
  #     update-all = "sudo nixos-rebuild switch --upgrade";
  #     # gs = "git status --short --color"; # Show a short and colored status of the Git repository
  #     # gl = "git log --oneline --graph --decorate --color"; # Display a concise and colorful log of commits
  #     # gco = "git checkout"; # Checkout branches or files in Git
  #     # gcm = "git commit -m"; # Commit changes with a message in Git
  #     # gpo = "git push origin"; # Push changes to the origin remote in Git
  #     # gp = "git pull"; # Pull the latest changes from the remote repository
  #     ".." = "cd .."; # Go up one directory level
  #     "..." = "cd ../.."; # Go up two directory levels
  #     h = "history"; # Show the command history
  #     cls = "clear"; # Clear the terminal screen
  #     # cpy = "xclip -selection clipboard"; # Copy the selected text to the clipboard (requires xclip)
  #     mkcd = "mkdir -p \$1 && cd \$1"; # Create a directory and change into it in one command
  #     grep = "grep --color=auto"; # Enable colored output for grep matches
  #     egrep = "egrep --color=auto"; # Enable colored output for extended grep matches
  #     fgrep = "fgrep --color=auto"; # Enable colored output for fixed-string grep matches
  #     df = "df -h --color=auto"; # Show disk space usage in human-readable format with color
  #     du = "du -h --max-depth=1 --color=auto"; # Show disk usage for current directory with color and depth limit
  #     tree = "tree -C"; # Display directory structure in a tree format with color
  #     rsync = "rsync -av --progress"; # Archive files with verbose output and progress display
  #     ping = "ping -c 5"; # Send 5 packets to check network connectivity
  #     # ssh = "ssh -o ServerAliveInterval=60"; # Keep SSH connections alive
  #   };

  #   history = {
  #     append = true;
  #     expireDuplicatesFirst = true;
  #     ignoreAllDups = true;
  #     ignorePatterns = [ "rm *" "pkill *" "cp *" ];
  #     save = 10000000;
  #     size = 10000000;
  #   };
  # };

}
