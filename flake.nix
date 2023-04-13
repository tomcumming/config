{
  description = "My home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    unixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, unixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      upkgs = unixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      homeConfigurations.macmini = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./macmini/home.nix
        ];

        extraSpecialArgs = { upkgs = upkgs; };
      };
    };
}
