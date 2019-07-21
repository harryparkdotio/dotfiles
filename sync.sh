#!/bin/bash

set -e

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

function doIt() {
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

  # reload
  source ~/.zshrc
}

if [[ "$1" == "--force" ]] || [[ "$1" == "-f" ]]; then
  doIt
else
  printf "this may overwrite existing files in the home directory (~/). are you sure (y/n)? "
  read -r RESPONSE

  if [[ $RESPONSE =~ ^[yY]$ ]]; then
    doIt
  fi
fi

unset doIt
