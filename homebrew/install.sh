#!/bin/bash

# Check for Homebrew
if test ! $(which brew); then
  echo "  Installing Homebrew for you."

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install coreutils
brew install git
brew install gnupg
brew install golang
brew install grep
brew install kubectl
brew install kubectx
brew install vim --with-override-system-vi
brew install wget --with-iri
brew install zsh

brew tap caskroom/cask

brew cask install github
brew cask install google-chrome
brew cask install iterm2
brew cask install spotify
brew cask install visual-studio-code

brew cleanup

exit 0
