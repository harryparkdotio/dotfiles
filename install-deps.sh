#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install node

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install hyperzsh
curl https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme > $ZSH_CUSTOM/themes/hyperzsh.zsh-theme

# npm deps
npm install --global trash-cli
