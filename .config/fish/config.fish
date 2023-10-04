if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set fish_greeting

starship init fish | source

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

alias jf="cd ~/notes && sh ~/.scripts/journal/load_journal.sh && sh ~/.scripts/journal/journal.sh"
alias save="sh ~/.scripts/journal/save_journal.sh"
alias wk="cd ~/notes && sh ~/.scripts/weekly/weekly.sh && cd -"
alias ls="eza -al"
alias vim="nvim"

# tmux
alias base="sh ~/.scripts/tmux/base.sh"
alias pro="sh ~/.scripts/tmux/project.sh"

# Work related
alias work="cd ~/notes && sh ~/.scripts/log/log.sh && cd -"
alias twork="sh ~/.scripts/tmux/work.sh"
alias puhti="ssh "
alias mahti="ssh "
alias lumi="ssh -i .ssh/id_rsa "
alias epsilon="ssh "

# Open man with Neovim
export MANPAGER='nvim +Man!'
export MANWIDTH=80

# Pyenv stuff
pyenv init - | source
