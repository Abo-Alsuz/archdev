#!/bin/bash
source "$(dirname "$0")/init-helpers.sh"

install_sddm() {
  sudo pacman -S --noconfirm sddm
  enable_service sddm
}

echo "╔═══════════════════════════════════╗"
echo "║     Choose a DE / WM / WLC        ║"
echo "╚═══════════════════════════════════╝"
echo ""
echo "[1] Hyprland"
echo "[2] Sway"
echo "[3] KDE Plasma"
echo "[4] GNOME"
echo "[5] Cinnamon"
echo "[6] None"
echo ""
read -p "Enter choice [1-6]: " choice

case $choice in
1)
  sudo pacman -S --noconfirm hyprland waybar
  install_sddm
  ;;
2)
  sudo pacman -S --noconfirm sway waybar
  install_sddm
  ;;
3)
  sudo pacman -S --noconfirm plasma
  install_sddm
  ;;
4)
  sudo pacman -S --noconfirm gnome
  install_sddm
  ;;
5)
  sudo pacman -S --noconfirm cinnamon
  install_sddm
  ;;
6)
  echo "Skipping DE/WM installation."
  ;;
*)
  echo "Invalid choice, skipping."
  ;;
esac
