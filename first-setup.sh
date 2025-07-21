. scripts/setup-gnome-settings.sh

mkdir -p ~/.bashrc.d
ln -s $(pwd)/scripts/shell-defaults.sh ~/.bashrc.d/shell-defaults.sh

ln -s $(pwd)/.config ~

nix registry add config $(pwd)
nix profile add config
