#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM="$ZSH/custom"

curl https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme > $ZSH_CUSTOM/themes/hyperzsh.zsh-theme
