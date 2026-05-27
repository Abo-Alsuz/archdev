#!/bin/bash

echo "Installing Aur Helpers..."

# install yay, built in go
if ! command -v yay &> /dev/null; then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si --noconfirm
	cd -
else
	echo "yay is already installed."
fi

# install paru
if ! command -v paru &> /dev/null; then
	git clone https://aur.archlinux.org/paru.git /tmp/paru
	cd /tmp/paru
	makepkg -si --noconfirm
	cd -
else
	echo "paru is already installed."
fi

echo "AUR helpers are installed!"
