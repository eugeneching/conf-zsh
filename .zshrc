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
export VISUAL="vim"; export VISUAL EDITOR=vim; export EDITOR
 
# Zsh options.
# setopt extended_glob clobber
setopt interactivecomments
unsetopt correct
unsetopt auto_name_dirs
 
# Theme preferences.
ZSH_THEME="powerlevel10k/powerlevel10k"
 
# Zgen.
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load romkatv/powerlevel10k  
  zgen load agkozak/zsh-z
  zgen save
fi
 
# Functions.
pf () { open -a "Path Finder.app" $1; }
fl () { open -a "Forklift.app" $1; }
showssh() { cat $HOME/.ssh/config; }
 
# Aliases.
alias c='code'
alias d='docker'
alias r='ranger'
alias rgg='rg --files | rg -S $1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='exa'
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'
 
# Fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 
# Go anywhere
unalias ga
ga () {
    if [ -z $1 ]; then cd $HOME; return; fi
 
    if [ $1 = "___" ]; then cd $HOME/Downloads/___;
    elif [ $1 = "h" ] || [ $1 = "home" ]; then cd $HOME;
    elif [ $1 = "d" ] || [ $1 = "downloads" ]; then cd $HOME/Downloads;
    elif [ $1 = "c" ] || [ $1 = "dev" ] || [ $1 = "code" ]; then cd $HOME/dev/go/src/code.corp.qavar.com/dev;
    elif [ $1 = "c" ] || [ $1 = "code" ]; then cd $HOME/dev/go/src/code.corp.qavar.com/dev;
    elif [ $1 = "sec" ]; then cd $HOME/dev/sec;
    elif [ $1 = "broker" ]; then cd /Volumes/founders/qavar-security/brokers;
    elif [ $1 = "items" ] || [ $1 = "specs" ]; then cd $HOME/dev/sec/product-specs;
    else echo "No shortcut '$1'" ; fi
}

