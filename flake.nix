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
