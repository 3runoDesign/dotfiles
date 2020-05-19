#!/bin/bash
set -euo pipefail

echo "🚀 Setting up my Environment..."
sudo -v

# Update Homebrew
brew update

if test ! $(which zsh); then
  # Install and use zsh from Homebrew
  echo "Installing zsh from Homebrew..."
  brew install zsh
  chsh -s /usr/local/bin/zsh

  echo "✅ Installed Zsh"
fi

# Install .Oh-My-ZSH
if [ -d "$HOME/.oh-my-zsh" ] 
then
    echo "Directory $HOME/.oh-my-zsh exists." 
else
  # Oh My Zsh
  echo "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "Installing Theme Zsh"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi
echo "✅ Installed .Oh-My-ZSH"

# Install Homebrew cask packages
echo "Installing Homebrew cask packages"
brew tap homebrew/cask-fonts

homebrew_cask_packages(
  "lastpass",
  "docker",
  "sequel-pro",
  "visual-studio-code",
  "vlc",
  "deezer",
  "iterm2",
  "font-fira-code",
  "postman",
  "deezer",
  "opera",
  "spectacle"
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
	brew cask install "$homebrew_cask_package"
done
echo "✅ Installed packages"

# Copy ./.zshrc and aliases.zsh
cp -R $(pwd)/.zshrc "$HOME/.zshrc"
cp -R $(pwd)/aliases.zsh "$HOME/.oh-my-zsh/custom/aliases.zsh"
echo "✅ Copy files"

echo "Start :: Download Dark Theme :: iTerm2"
wget -cO - ~/Downloads https://github.com/dracula/iterm/archive/master.zip > Dracula-Theme-iterm2.zip
echo "Finish :: Download Dark Theme :: iTerm2"

# Complete
echo "Installation Complete 😎"
