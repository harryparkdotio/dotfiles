#!/bin/bash

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="hyperzsh"

plugins=(
  git osx zsh-syntax-highlighting zsh-completions zsh-autosuggestions yarn
)

source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,functions,aliases,path}; do
  [ -r "$file" ] && source "$file"
done
unset file

# load zsh-completions
autoload -U compinit && compinit

# load nvm
source $NVM_DIR/nvm.sh
