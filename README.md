A nix setup without home-manager!

## Setting up

Install nix with DeterminateSystems/nix-installer.

Symlink config:
```bash
ln -s /path/to/here/.config ~/.config
```

Add to registry, start dev shell for the first time to set settings:
```bash
nix registry add config /path/to/here
nix develop 'config#macmini'
```
