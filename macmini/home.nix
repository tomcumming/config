{ config, pkgs, ... }:

{
  home.username = "tomm";
  home.homeDirectory = "/Users/tomm";

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

    initExtra = "
if [ -z \"$IN_NIX_SHELL\" ]; then
export PROMPT='%F{blue}%1~ %f$ '
else 
export PROMPT='%F{red}%1~ %f$ '
fi
";

    shellAliases = {
      nixdev = "nix develop -c zsh";
    };
    
    enableVteIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Tom Cumming";
    userEmail = "mail@tomcumming.co.uk";

    delta.enable = true;
  };

  xdg.configFile."helix/config.toml".source = ../helix/config.toml;
  xdg.configFile."tmux/tmux.conf".source = ../tmux.conf;

  home.sessionVariables = {
    # This sorts out terminal bugs when client is chrome os
    LANG = "en_US.UTF-8";
  };

  home.packages = [
    # System
    pkgs.git
    pkgs.wget
    pkgs.curl
    pkgs.jq

    # Terminal Apps
    # pkgs.ncdu # Broken :'(
    pkgs.htop
    pkgs.tmux
    pkgs.helix
    pkgs.gitui
    pkgs.delta

    #Apps
    pkgs.anki-bin
  ];
}
