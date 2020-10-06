#!/bin/sh
#
# cli

export DOTFILES=$HOME/.dotfiles

# set macOS defaults
$DOTFILES/macos/set-defaults.sh

# install homebrew
$DOTFILES/homebrew/install.sh 2>&1

# upgrade homebrew
echo "› brew update"
brew update

# install software
echo "› $DOTFILES/script/install"
$DOTFILES/script/install
