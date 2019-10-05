#!/bin/zsh

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

# update PATH for the Google Cloud SDK
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# enable shell command completion for gcloud
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

zstyle ':completion::complete:git-checkout:argument-rest:commit-tag-refs' command "echo"
zstyle ':completion::complete:git-checkout:argument-rest:blob-tag-refs' command "echo"
