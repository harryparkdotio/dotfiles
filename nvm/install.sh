#!/bin/bash

if [[ ! -f "$NVM_DIR/nvm.sh" ]]; then
  echo "  Installing nvm for you."

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fi
