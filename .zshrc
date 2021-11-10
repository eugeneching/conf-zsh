# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
f () { open -a "Forklift.app" $1; }

# Aliases.
alias c='code'
alias d='docker'
alias rgg='rg --files | rg -S $1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='exa'

zstyle ':bracketed-paste-magic' active-widgets '.self-*'
zstyle ':completion:*' matcher-list '' 'm:{a-z\-}={A-Z\_}' 'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' 'r:|?=** m:{a-z\-}={A-Z\_}'

source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
