#!/bin/bash
if systemctl --user is-active --quiet pipewire; then
	echo "PipeWire is already running,"
	echo "Stopping audio setup..."
	exit 0 
fi

echo "Setting up PipeWire audio."
sudo pacman -S --noconfirm pipewire pipewire-alsa wireplumber pipewire-pulse pipewire-jack wiremixer
sudo systemctl enable --now pipewire wireplumber pipewire-pulse
echo "Audio setup Complete!"
