#!/bin/bash

session="base"

tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window 'note'
tmux send-keys -t $session:$window 'jf' C-m

window=2
tmux new-window -t $session:$window -n 'code'
tmux send-keys -t $session:$window 'cd ~/repos' C-m

window=3
tmux new-window -t $session:$window -n 'term'

tmux a -t  $session:1
