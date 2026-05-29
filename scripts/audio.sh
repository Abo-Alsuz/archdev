#!/bin/bash
source "$(dirname "$0")/init-helpers.sh"

if check_user_service pipewire; then
	echo "PipeWire is already running,"
	echo "Stopping audio setup..."
	exit 0
fi

echo "Setting up PipeWire audio."
sudo pacman -S --noconfirm pipewire pipewire-alsa wireplumber pipewire-pulse pipewire-jack wiremixer
enable_user_service pipewire
enable_service wireplumber
enable_service pipewire-pulse
echo "Audio setup Complete!"
