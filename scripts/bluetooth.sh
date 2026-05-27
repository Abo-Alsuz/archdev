#!/bin/bash
if systemctl is-active --quiet bluetooth; then
	echo "Bluetooth is already running,"
	echo "Stopping Bluetooth setup."
	exit 0
fi

echo "Setting up bluetooth.."
sudo pacman -S --noconfirm bluez bluez-utils
sudo systemctl enable --now bluetooth
echo "Bluetooth setup is complete!"
