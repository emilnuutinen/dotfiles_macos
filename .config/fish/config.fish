if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set fish_greeting

starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
