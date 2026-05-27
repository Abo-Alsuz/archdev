#!/bin/bash

echo "╔═══════════════════════════════════╗"
echo "║   ArchDev Bootstrap Installer     ║"
echo "╚═══════════════════════════════════╝"
echo ""

bash scripts/aur.sh
bash scripts/fonts.sh

echo ""
echo "╔═══════════════════════════════════╗"
echo "║         System Setup              ║"
echo "╚═══════════════════════════════════╝"
echo ""

read -p "Setup audio? (PipeWire) [y/n]: " answer
[[ "$answer" == "y" ]] && bash scripts/audio.sh

read -p "Setup Bluetooth? [y/n]: " answer
[[ "$answer" == "y" ]] && bash scripts/bluetooth.sh

read -p "Setup ZSH? (3 plugins + Starship) [y/n]: " answer
[[ "$answer" == "y" ]] && bash scripts/zsh.sh

read -p "Install development kit? (rust, go, lua, python, nodejs) [y/n]: " answer
[[ "$answer" == "y" ]] && bash scripts/devkit.sh

read -p "Install Neovim + NvChad? [y/n]: " answer
[[ "$answer" == "y" ]] && bash scripts/nvim.sh


echo ""
echo "╔═══════════════════════════════════╗"
echo "║      ArchDev setup complete!      ║"
echo "╚═══════════════════════════════════╝"
