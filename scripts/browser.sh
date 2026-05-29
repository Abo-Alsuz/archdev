#!/bin/bash

echo "Choose a browser:"
echo "╔═══════════════════════════════════╗"
echo "║  [1] Firefox                      ║"
echo "║  [2] Waterfox                     ║"
echo "║  [3] Helium                       ║"
echo "║  [4] Brave                        ║"
echo "║  [5] None                         ║"
echo "╚═══════════════════════════════════╝"
read -p "Enter choice [1-5]: " choice

case $choice in
1) sudo pacman -S --noconfirm firefox ;;
2) yay -S --noconfirm waterfox-bin ;;
3) sudo yay -S --noconfirm helium-browser-bin ;;
4) yay -S --noconfirm brave-bin ;;
5) echo "Skipping browser installation." ;;
*) echo "Invalid choice, skipping." ;;
esac
