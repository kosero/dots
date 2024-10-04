# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aussiegeek"
# ZSH_THEME_RANDOM_CANDIDATES=( "refined" "aussiegeek" )

zstyle ':omz:update' mode disabled
zstyle ':omz:update' mode auto
zstyle ':omz:update' mode reminder

zstyle ':omz:update' frequency 13

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export PATH=$HOME/.local/bin:$PATH

export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS="-arch $(uname -m)"
export TERMINAL="alacritty"

alias ls="lsd -l --color always"
