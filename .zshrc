# Path to your oh-my-zsh installation.
export ZSH="/Users/emil/.oh-my-zsh"

EDITOR=nvim

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias jf="cd ~/notes && sh ~/.scripts/journal/load_journal.sh && sh ~/.scripts/journal/journal.sh"
alias save="sh ~/.scripts/journal/save_journal.sh"
alias wk="cd ~/notes && sh ~/.scripts/weekly/weekly.sh"
alias ls="eza -al"
alias duck="sh ~/.scripts/duck.sh"
alias '?'=duck
alias vim="nvim"

# tmux
alias base="sh ~/.scripts/tmux/base.sh"
alias pro="sh ~/.scripts/tmux/project.sh"

# Work related
alias work="cd ~/notes && sh ~/.scripts/log/log.sh"
alias twork="sh ~/.scripts/tmux/work.sh"
alias puhti="ssh "
alias mahti="ssh "
alias epsilon="ssh "

# Go path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

 # Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Set Starship as theme
eval "$(starship init zsh)"

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
