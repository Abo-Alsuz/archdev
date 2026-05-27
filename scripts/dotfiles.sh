#!/bin/bash

echo "Applying dotfiles..."

mkdir -p ~/.config/alacritty
cp dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

echo "Dotfiles applied!"
