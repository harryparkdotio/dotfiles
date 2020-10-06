#!/bin/zsh

export ZSH=$HOME/.oh-my-zsh

source <(antibody init)

# fix zsh-syntax-highlighting bug w/ antibody
unset X_ZSH_HIGHLIGHT_DIRS_BLACKLIST

antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle "MichaelAquilina/zsh-you-should-use"

plugins=(git terraform)

# theme
antibody bundle tylerreckart/hyperzsh

ZSH_THEME="hyperzsh"

# disable magic functions - magic functions slow down pasting
# https://apple.stackexchange.com/questions/312795/zsh-paste-from-the-clipboard-a-command-takes-a-few-second-to-be-write-in-the-ter
# https://github.com/ohmyzsh/ohmyzsh/issues/5569
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,functions,aliases,path}; do
  [ -r "$file" ] && source "$file"
done
unset file

# update PATH for the Google Cloud SDK
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# enable shell command completion for gcloud
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

zstyle ':completion::complete:git-checkout:argument-rest:commit-tag-refs' command "echo"
zstyle ':completion::complete:git-checkout:argument-rest:blob-tag-refs' command "echo"

export NVM_LAZY_LOAD=true
antibody bundle lukechilds/zsh-nvm

# must be last
antibody bundle zsh-users/zsh-syntax-highlighting
