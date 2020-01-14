#!/bin/bash

set -e

function doIt() {
  git_email=$(git config --global user.email)
  git_name=$(git config --global user.name)
  git_signingkey=$(git config --global user.signingkey)

  rsync \
    --exclude ".brew" \
    --exclude ".DS_Store" \
    --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude ".macos" \
    --exclude "install-deps.sh" \
    --exclude "license" \
    --exclude "readme.md" \
    --exclude "sync.sh" \
    -av --no-perms . ~

  # don't override user.{email, name, signingkey} when syncing
  git config --global user.email "$git_email"
  git config --global user.name "$git_name"
  git config --global user.signingkey "$git_signingkey"
}

if [[ "$1" == "--force" ]] || [[ "$1" == "-f" ]]; then
  doIt
else
  # check branch is master
  if [[ $(git rev-parse --abbrev-ref HEAD) != "master" ]]; then
    echo "current branch must be master to sync"
    exit 1
  fi

  # check working tree clean
  if [[ -n $(git status -s) ]]; then
    echo "working tree must be clean to sync"
    exit 1
  fi

  printf "this may overwrite existing files in the home directory (~/). are you sure (y/n)? "
  read -r RESPONSE

  if [[ $RESPONSE =~ ^[yY]$ ]]; then
    doIt
  fi
fi

unset doIt
