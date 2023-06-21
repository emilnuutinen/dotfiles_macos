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

alias jf="cd ~/notes && sh ~/.scripts/journal/load_journal.sh && sh ~/.scripts/journal/journal.sh && cd -"
alias save="sh ~/.scripts/journal/save_journal.sh"
alias wk="cd ~/notes && sh ~/.scripts/weekly/weekly.sh && cd -"
alias ls="exa -al"
alias vim="nvim"

# tmux
alias base="sh ~/.scripts/tmux/base.sh"
alias pro="sh ~/.scripts/tmux/project.sh"

# Work related
alias work="cd ~/notes && sh ~/.scripts/log/log.sh && cd -"
alias twork="sh ~/.scripts/tmux/work.sh"
alias puhti="ssh [ADDRESS]"
alias mahti="ssh [ADDRESS]"
alias epsilon="ssh [ADDRESS]"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

