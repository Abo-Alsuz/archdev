#!/bin/bash
if [ "$SHELL" = "$(which zsh)" ]; then
	echo "Zsh is already the default shell,"
	echo "Stopping Zsh Setup..."
	exit 0
fi

echo "Setting up Zsh..."
sudo pacman -S --noconfirm zsh zsh-autosuggestion zsh-syntax-highlighting zsh-history-substring-search starship

# add the plugins ~/.zshrc
cat >> ~/.zshrc << 'EOF'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
eval "$(starship init zsh)"
EOF

# changing the default shell to Zsh
chsh -s $(which zsh)

# copying starship.toml over to ~/.config
mkdir -p ~/.config
cp dotfiles/starship.toml ~/.config/starship.toml

echo "Zsh Setup complete! Just log Out and back in for the shell to take effect."
