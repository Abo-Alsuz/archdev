# archdev

A developer/casual user oriented Arch Linux bootstrap script.

## What it does

Automates the painful parts of a fresh Arch install. Audio, Bluetooth, AUR helpers, fonts, shell, editor, DE/WM — all in one guided script with yes/no questions.

## Why this exists

Every fresh Arch install meant spending hours setting up the same things. This fixes that.

## Install

```bash
git clone https://github.com/Abo-Alsuz/archdev
cd archdev
bash install.sh
```

## What it installs

**Always:**
- yay + paru (AUR helpers)
- Noto fonts (full unicode coverage)
- JetBrains Mono Nerd Font

**Optional:**
- PipeWire audio
- Bluetooth
- ZSH + autosuggestions, syntax highlighting, history search + Starship prompt
- Development kit (base-devel, rust, go, lua, python, nodejs)
- Neovim + LazyVim + Carbon theme
- IDE of choice (VSCode, VSCodium, Zed, Cursor)
- DE/WM of choice (Hyprland, Sway, KDE, GNOME, Cinnamon) + SDDM
- Nvidia drivers (auto-detected).
- Browser

## Structure
```
archdev/
├── install.sh
├── scripts/
│   ├── aur.sh
│   ├── audio.sh
│   ├── bluetooth.sh
│   ├── fonts.sh
│   ├── devkit.sh
│   ├── zsh.sh
│   ├── nvim.sh
│   ├── ide.sh
|   ├── wm.sh
|   ├── browser.sh
|   └── nvidia.sh
|
└── dotfiles/
├── nvim/
│   ├── colors/carbon.lua
│   └── plugins/carbon.lua
├── alacritty.toml
└── starship.toml
```
## Requirements

- Fresh Arch Linux install
- Internet connection
- A working brain (optional)

## License

GPL-3.0 — fork it, improve it, keep it free.
