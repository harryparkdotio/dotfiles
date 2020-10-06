#!/bin/bash

# don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper cache
fi

# use vscode as mergetool
if command -v code >/dev/null 2>&1; then
  git config --global merge.tool vscode
  git config --global mergetool.vscode.cmd "code --wait $MERGED"
fi
