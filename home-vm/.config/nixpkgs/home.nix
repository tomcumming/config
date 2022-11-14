{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tommo";
  home.homeDirectory = "/home/tommo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.helix
    pkgs.gitui
    pkgs.jq
    pkgs.wget
    pkgs.bzip2
    pkgs.ncdu
  ];

  home.shellAliases = {
    nixdev = "nix develop --command zsh";
  };

  programs.zsh = {
    enable = true;
    initExtra = "export PROMPT='%2~ %% '";
  };

  programs.git = {
    enable = true;
    userName = "Tom Cumming";
    userEmail = "mail@tomcumming.co.uk";
  };
}

