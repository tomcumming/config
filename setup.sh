cp .zshrc ~/.zshrc
nix registry add config $(pwd)
nix profile install config
