#!/bin/bash

# detect nvidia GPU
GPU=$(lspci | grep -i "vga\|3d" | grep -i nvidia)

if [ -z "$GPU" ]; then
  echo "No NVIDIA GPU detected, skipping..."
  exit 0
fi

echo "Detected: $GPU"

# extract chip prefix from lspci
CHIP=$(echo "$GPU" | grep -oP '(GB|AD|GA|TU|GV|GP|GM|GK|GF)\d+')
PREFIX=$(echo "$CHIP" | grep -oP '^[A-Z]+')

echo "Architecture prefix: $PREFIX"

case $PREFIX in
GB | AD | GA | TU | GV)
  echo "Mainline driver supported"
  DRIVER="nvidia-dkms"
  UTILS="nvidia-utils"
  LEGACY=false
  ;;
GP | GM)
  echo "Legacy 580xx driver required"
  DRIVER="nvidia-580xx-dkms"
  UTILS="nvidia-580xx-utils"
  LEGACY=true
  ;;
GK)
  echo "Legacy 470xx driver required"
  DRIVER="nvidia-470xx-dkms"
  UTILS="nvidia-470xx-utils"
  LEGACY=true
  ;;
GF)
  echo "Legacy 390xx driver required"
  DRIVER="nvidia-390xx-dkms"
  UTILS="nvidia-390xx-utils"
  LEGACY=true
  ;;
*)
  echo "Unknown GPU, falling back to nouveau..."
  exit 0
  ;;
esac

echo "Installing $DRIVER..."
yay -S --noconfirm $DRIVER $UTILS

# add nvidia modules to mkinitcpio
sudo sed -i 's/^MODULES=(\(.*\))/MODULES=(\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
sudo mkinitcpio -P

# bootloader selection for kernel parameters (legacy only)
if [ "$LEGACY" = true ]; then
  echo ""
  echo "Which bootloader are you using?"
  echo "[1] GRUB"
  echo "[2] systemd-boot"
  echo "[3] Skip (I'll do it manually)"
  read -p "Enter choice [1-3]: " bootloader

  case $bootloader in
  1)
    sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 nvidia-drm.modeset=1"/' /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ;;
  2)
    echo "Add 'nvidia-drm.modeset=1' to your kernel options in /boot/loader/entries/"
    ;;
  3)
    echo "Skipping, add nvidia-drm.modeset=1 manually."
    ;;
  esac
else
  echo "Driver 595+, modeset enabled by default, skipping kernel parameter..."
fi

echo ""
echo "NVIDIA drivers installed! Reboot required."
# well that was long.
