#!/bin/bash

# Check for Homebrew
if test ! $(which brew); then
  echo "  Installing Homebrew for you."

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_add() { if brew ls --versions "$1"; then HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"; else HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"; fi }

brew_add coreutils
brew_add git
brew_add gnupg
brew_add golang
brew_add grep
brew_add kubectl
brew_add kubectx
brew_add vim
brew_add wget
brew_add zsh

brew tap homebrew/cask

CASKS=(
  github
  google-chrome
  iterm2
  spotify
  visual-studio-code
)

brew cask install ${CASKS[@]}

brew cleanup

exit 0
