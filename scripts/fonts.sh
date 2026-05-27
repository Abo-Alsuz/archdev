#!/bin/bash

echo "Installing fonts..."
sudo pacman -S --noconfirm \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-extra \
    noto-fonts-emoji \
    ttf-jetbrains-mono-nerd
echo "Fonts installed!"
