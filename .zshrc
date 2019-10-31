# Path.
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/dev/go
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi
export PATH="/usr/local:/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$GOROOT/bin

# Environment.
export EDITOR="vim"

# Zsh.
setopt extended_glob clobber
setopt interactivecomments
unsetopt correct
unsetopt auto_name_dirs

# Theme preferences.
AGKOZAK_CUSTOM_RPROMPT='%F{black}%*%f'
AGKOZAK_PROMPT_DIRTRIM=0
AGKOZAK_BLANK_LINES=1
AGKOZAK_COLORS_EXIT_STATUS=black
AGKOZAK_COLORS_USER_HOST=red
AGKOZAK_COLORS_PATH=green
AGKOZAK_COLORS_BRANCH_STATUS=yellow
AGKOZAK_LEFT_PROMPT_ONLY=1

# Zgen.
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen load agkozak/agkozak-zsh-prompt
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen save
fi

# Functions.
pf () { open -a "Path Finder.app" $1; }

# Aliases.
alias rgg='rg --files | rg -S $1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='exa'
alias c='code'
alias d='docker'
alias gentoday='date +%Y%m%d-%N'
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'


# Fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go anywhere
unalias ga
ga () {
    if [ -z $1 ]; then cd $HOME; return; fi
    if [ $1 = "h" ]; then cd $HOME;
    elif [ $1 = "d" ]; then cd $HOME/Downloads;
    elif [ $1 = "c" ] || [ $1 = "code" ]; then cd $HOME/dev/go/src/code.corp.qavar.com/dev;
    elif [ $1 = "sec" ]; then cd $HOME/dev/sec;
    elif [ $1 = "broker" ]; then cd /Volumes/founders/qavar-security/brokers;
    elif [ $1 = "items" ]; then cd $HOME/dev/sec/product-specs;
    else echo "No shortcut '$1'" ; fi
}

