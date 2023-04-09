#!/bin/bash

session=$1

if [ ! -d ~/repos/$session ]; then
  mkdir ~/repos/$session
fi

cd ~/repos/$session

tmux new-session -d -s $session

window=1
tmux send-keys -t $session:$window 'vim' C-m

window=2
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
