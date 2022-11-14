{
  outputs = { nixpkgs, self }: {
    formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixpkgs-fmt;
  };
}
