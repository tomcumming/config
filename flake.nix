{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    unixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      upkgs = unixpkgs.legacyPackages.${system};

      zshrc = ''
        if [ -z \"$IN_NIX_SHELL\" ]; then
          # Not in dev shell
        else
          if [ -z \"$IN_OUTER_SHELL\" ]; then
            export PROMPT=\'%F{red}%1~ %f$ \'
          else
            export PROMPT=\'%F{blue}%1~ %f$ \'
          fi
        fi

        alias start-outer-shell="nix develop --offline \'config#macmini\' -c tmux"
        alias nixdev="nix develop -u \'IN_OUTER_SHELL\' -c zsh"
        
        # Fix annoying osx keys
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
      '';
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      devShells.${system}.macmini = pkgs.mkShell {
        name = "Macmini shell";

        shellHook = ''
          echo $'${zshrc}' > ~/.zshrc # Write the zsh config file
          export LANG="en_US.UTF-8"
          export IN_OUTER_SHELL=1
        '';

        packages = [
          # System
          pkgs.git
          pkgs.wget
          pkgs.curl
          pkgs.jq

          # Terminal Apps
          pkgs.ncdu
          pkgs.htop
          pkgs.tmux
          upkgs.helix
          upkgs.gitui
          pkgs.delta

          #Apps
          pkgs.anki-bin
        ];
      };
    };
}
