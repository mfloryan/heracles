#!/bin/bash
source /usr/local/git/contrib/completion/git-prompt.sh

export PROMPT_COMMAND='__git_ps1 "\[$BLUE\]\w\e\[$RESET\]" " \[$YELLOW\]\\\$\[$RESET\] "'
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=verbose
