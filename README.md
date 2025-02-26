# NixOS Dotfiles

This repository contains my NixOS configuration files.


## Prerequisites
- Ensure you have `git` and `nix` installed on your system.


## Usage

```sh
# Clone the repository
git clone https://github.com/criticalfernet/NixDotfiles ~/Dotfiles
cd ~/Dotfiles

# Switch to the new configuration
sudo nixos-rebuild switch -I nixos-config=./configuration.nix

# Stow all the configs
for dir in */;do stow "$dir"; done

```

