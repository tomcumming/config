A nix setup without home-manager!

## Setting up

Install nix with DeterminateSystems/nix-installer.

Symlink config:
```bash
ln -s /path/to/here/.config ~/.config
```

Run `./setup.sh` and source `~/.zshrc`

`nix flake update` and `nix profile upgrade` to update packages
