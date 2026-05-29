#!/bin/bash
source "$(dirname "$0")/init-helpers.sh"

if check_service bluetooth; then
	echo "Bluetooth is already running,"
	echo "Stopping Bluetooth setup."
	exit 0
fi

echo "Setting up bluetooth.."
sudo pacman -S --noconfirm bluez bluez-utils
enable_service bluetooth
echo "Bluetooth setup is complete!"
