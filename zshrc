# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
export SAVEHIST=100000
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
setopt notify
setopt NO_CASE_GLOB

# setopt CORRECT
# setopt CORRECT_ALL

unsetopt autocd beep

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

# zstyle ':completion:*' auto-description '%d'
# zstyle ':completion:*' format '%d'
# zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' verbose true
# zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zmodload zsh/zprof
autoload -U bashcompinit
bashcompinit
autoload -U promptinit
promptinit

# export ZDOT="/opt/local/etc"

# source /opt/local/etc/zshenv
# source /opt/local/etc/zshrc

# ===============================================================
# ===================== $PATH SETTINGS ==========================
# ===============================================================

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$GOBIN"
PATH="$PATH":/Users/admin/.local/bin
PATH="$PATH:$HOME/Library/Python/3.7/bin"
PATH="$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin"
PATH="$PATH:$HOME/Applications/Firefox.app/Contents/MacOS"
PATH="$PATH":"$HOME/Library/Python/3.8/bin"

export DOTFILES="$HOME/dotfiles"

source "$DOTFILES/all.sh"
# source "/opt/local/share/tldr-cpp-client/autocomplete/complete.zsh"
# source /opt/local/bin/aws_zsh_completer.sh

# Created by `userpath` on 2020-05-20 10:37:23
export PATH="$PATH:/Users/admin/.local/bin"

export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.8'
export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.8'
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.8'
# source /opt/local/bin/virtualenvwrapper.sh-3.8

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

[[ $- == *i* ]] && source "$HOME/dotfiles/liquidprompt/liquidprompt"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export JAVA_OPTS="-Dfile.encoding=UTF-8"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home

fpath=(/Users/admin/dotfiles/zsh-completion $fpath)
# fpath=(/Users/admin/.zsh/gradle-completion $fpath)

# eval "$(rbenv init -)"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end

# eval "$(register-python-argcomplete pipx)"
# eval "$(_SCEPTRE_COMPLETE=source_zsh sceptre)"
#compdef cfn-cli
_cfn-cli() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CFN_CLI_COMPLETE=complete-zsh  cfn-cli)
}

# TODO: Переписать во что-то понятное и читаемое
if [[ "$(basename -- ${(%):-%x})" != "_cfn-cli" ]]; then
  compdef _cfn-cli cfn-cli
fi

# ==================================================================
# eval "$(chef shell-init zsh)"
# ==================================================================

# source /Users/admin/.config/broot/launcher/bash/br

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/admin/yandex-cloud/path.bash.inc' ]; then source '/Users/admin/yandex-cloud/path.bash.inc'; fi

# eval "$(direnv hook zsh)"

# The next line enables shell command completion for yc.
if [ -f '/Users/admin/yandex-cloud/completion.zsh.inc' ]; then source '/Users/admin/yandex-cloud/completion.zsh.inc'; fi

# [[ /opt/local/bin/kubectl ]] && source <(kubectl completion zsh)
export PATH="/Users/admin/bin/Sencha/Cmd:$PATH"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.18/gems/vagrant-2.2.18/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

source /opt/local/share/nvm/init-nvm.sh
source /opt/local/share/tldr-cpp-client/autocomplete/complete.zsh
