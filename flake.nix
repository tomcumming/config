{
  inputs = {
    # unixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      packages.${system}.default = pkgs.buildEnv {
        name = "My global packages";

        paths = [
          # Commands
          pkgs.wl-clipboard
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
        ];
      };
    };
}
