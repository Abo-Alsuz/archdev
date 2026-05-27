#!/bin/bash

echo "Choose an IDE:"
echo "╔═══════════════════════════════════╗"
echo "║  [1] VSCode (code)                ║"
echo "║  [2] VSCodium (vscodium-bin)      ║"
echo "║  [3] Zed                          ║"
echo "║  [4] Cursor (cursor-bin)          ║"
echo "║  [5] None                         ║"
echo "╚═══════════════════════════════════╝"
read -p "Enter choice [1-4]: " choice

case $choice in
1) sudo pacman -S --noconfirm code ;;
2) yay -S --noconfirm vscodium-bin ;;
3) sudo pacman -S --noconfirm zed ;;
4) yay -S --noconfirm cursor-bin ;;
5) echo "Skipping IDE installation." ;;
*) echo "Invalid choice, skipping." ;;
esac
