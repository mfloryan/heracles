alias git='/usr/local/git/bin/git'

alias ls='ls -G'
export LSCOLORS=ExFxCxDxBxegedabagacad

RED=$(tput setaf 196)
BLUE=$(tput setaf 32)
GREEN=$(tput setaf 40)
YELLOW=$(tput setaf 11)
RESET=$(tput sgr0)

# PS1="\e[0;37m\$? \$(if [[ \$? == 0 ]]; then echo \"\e[01;32m\342\234\223\"; else echo \"\e[01;31m\342\234\227\"; fi)\e[1;34m \w \e[1;33m\$\e[00m "
PS1="\$(if [[ \$? == 0 ]]; then echo \"\[$GREEN\]\342\234\223\"; else echo \"\[$RED\]\342\234\227\"; fi) \[$BLUE\]\w \[$YELLOW\]\$\[$RESET\] "
