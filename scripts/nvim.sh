#!/bin/bash

if command -v nvim &>/dev/null && [ -d ~/.config/nvim ]; then
  echo "Neovim already installed, skipping..."
  exit 0
fi

echo "Installing Neovim..."
sudo pacman -S --noconfirm neovim ripgrep

echo "Setting up LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim --depth 1
rm -rf ~/.config/nvim/.git

echo "Installing Carbon theme..."
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/nvim/lua/plugins
cp dotfiles/nvim/colors/carbon.lua ~/.config/nvim/colors/carbon.lua
cp dotfiles/nvim/plugins/carbon.lua ~/.config/nvim/lua/plugins/carbon.lua

echo "Neovim setup complete! Run nvim to finish plugin installation."
