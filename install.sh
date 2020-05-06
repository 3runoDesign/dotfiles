#!/bin/bash
set -euo pipefail

echo "Setting up my Environment..."
sudo -v

# Update Homebrew
brew update

if test ! $(which zsh); then
  # Install and use zsh from Homebrew
  echo "Installing zsh from Homebrew..."
  brew install zsh
  chsh -s /usr/local/bin/zsh

  # Oh My Zsh
  echo "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "Installing Theme Zsh"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
else
  echo "✅ Zsh Install"
fi


# Install Homebrew cask packages
echo "Installing Homebrew cask packages"
brew tap homebrew/cask-fonts

homebrew_cask_packages(
  "lastpass", # Gerenciador de senhas
  "docker", # Software contêiner
  "sequel-pro", # IDE para DB
  "visual-studio-code", # Editor
  "vlc", # Media player
  "rocket", # Gerenciado de emojis
  "deezer", # Player de música
  "iterm2", # Terminal
  "font-fira-code", # Fonte
  "postman", # Workflows para APIs
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
	brew cask install "$homebrew_cask_package"
done
echo "✅ Installed packages"

# Copy ./.zshrc and aliases.zsh
cp -R $(pwd)/.zshrc "$HOME/.zshrc"
cp -R $(pwd)/aliases.zsh "$HOME/.oh-my-zsh/custom/aliases.zsh"

echo "✅ Copy files"

# Complete
echo "Installation Complete 😎"
