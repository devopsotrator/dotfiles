# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.zsh_history"
HISTSIZE=3000
SAVEHIST=10000
setopt nomatch
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

setopt NO_CASE_GLOB

# setopt CORRECT
# setopt CORRECT_ALL

unsetopt autocd beep extendedglob notify

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zmodload zsh/zprof
# autoload bashcompinit && bashcompinit
# autoload -U promptinit; promptinit
# export ZDOT="/opt/local/etc"

source /opt/local/etc/zshenv
source /opt/local/etc/zshrc

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$GOBIN"
PATH="$PATH:$HOME/Library/Python/3.7/bin"

# Finished adapting your PATH environment variable for use with MacPorts.
export PATH

export VCD_USE_COLORED_OUTPUT=1

export JAVA_OPTS="-Dfile.encoding=UTF-8"

export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.7'
export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.7'
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.7'
source "/opt/local/bin/virtualenvwrapper.sh-3.7"

export EDITOR='subl -w'

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

_fzf_compgen_path() {
	 fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	 fd --type d --hidden --follow --exclude ".git" . "$1"
}

[[ $- == *i* ]] && source "$HOME/dotfiles/liquidprompt/liquidprompt"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export DOTFILES="$HOME/dotfiles"

source "$DOTFILES/.all.sh"
source "/opt/local/share/tldr-cpp-client/autocomplete/complete.zsh"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home

source /opt/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# opam configuration
test -r /Users/admin/.opam/opam-init/init.zsh && . /Users/admin/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
