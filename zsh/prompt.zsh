#!/bin/zsh
export PROMPT='$(_python_venv)%{$fg[cyan]%}%c $(git_prompt_info)%{$reset_color%}%{$fg[magenta]%}$(_git_time_since_commit)$(git_prompt_status)${_return_status}$ '
