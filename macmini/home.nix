{ config, pkgs, ... }:

{
  home.username = "tomm";
  home.homeDirectory = "/Users/tomm";

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Tom Cumming";
    userEmail = "mail@tomcumming.co.uk";

    delta.enable = true;
  };

  xdg.configFile."helix/config.toml".source = ../helix/config.toml;

  home.packages = [
    # System
    pkgs.git
    pkgs.wget
    pkgs.curl
    pkgs.jq

    # Terminal Apps
    pkgs.ncdu
    pkgs.helix
    pkgs.gitui
    pkgs.delta
  ];
}
