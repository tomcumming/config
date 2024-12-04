{
  inputs = {
    # unixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
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
          pkgs.hexyl

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
