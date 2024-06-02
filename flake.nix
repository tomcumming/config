{
  inputs = {
    unixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, unixpkgs, nixpkgs }:
    let
      system = "aarch64-darwin";
      upkgs = unixpkgs.legacyPackages.${system};
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      packages.${system}.default = pkgs.buildEnv {
        name = "My global packages";

        paths = [
          # System
          pkgs.git
          pkgs.wget
          pkgs.curl
          pkgs.jq
          pkgs.xz

          # Terminal Apps
          pkgs.ncdu
          pkgs.htop
          pkgs.tmux
          pkgs.helix
          pkgs.gitui
          pkgs.delta

          # Dictionary
          pkgs.aspell
          pkgs.aspellDicts.en

          #Apps
          pkgs.anki-bin
          pkgs.wezterm
        ];
      };
    };
}
