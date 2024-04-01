#!/bin/fish
num=$(ps l |rg tmux-nvim| wc -l)
tmux new-session -d -s nvim$num
#oomux send-keys -t nvim:nvim "cd /my/directory" onter
tmux send-keys -t nvim$num "env http_proxy=http://127.0.0.1:9910 https_proxy=http://127.0.0.1:9910 nvim" Enter
foot tmux attach -t nvim$num
