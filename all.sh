#! bin/bash

# source files
# source "$DOTFILES/.paths.sh"
source "$DOTFILES/aliases.sh"
source "$DOTFILES/functions.sh"

# $include "$DOTFILES/.inputrc" # doesn't work on Mac

# export all functions
# causes sub bash calls (like with xargs) throw errors
# eval "$(declare -F | sed -e 's/-f /-fx /')"

# tmp here
#if [ -f ~/.bash_completion ]; then
#   . ~/.bash_completion
#fi
