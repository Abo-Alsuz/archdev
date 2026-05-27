#!/bin/bash

echo "Installing Development Kit (base-devel, rust, go, lua, python, nodejs, npm)"
sudo pacman -S --noconfirm base-devel rust go lua python nodejs npm
echo "Development Kit installed!"
