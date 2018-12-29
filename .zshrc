#!/bin/bash

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="hyperzsh"

plugins=(
  git zsh-syntax-highlighting zsh-completions
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

for file in ~/.{exports,aliases,path}; do
  [ -r "$file" ] && source "$file"
done
unset file

# load zsh-completions
autoload -U compinit && compinit
