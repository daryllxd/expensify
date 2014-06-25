tmux new-session -d -s expensify

tmux new-window -t bento:1 -n 'vim'
tmux select-window -t 1
tmux split-window -d -t 0 -h
tmux split-window -d -t 1 -v

tmux send-keys -t 0 'vim -O2 .' enter
tmux send-keys -t 1 'mysql.server start' enter
tmux send-keys -t 1 'bundle exec rails server' enter
tmux send-keys -t 2 'git status' enter

tmux select-pane -t 0
tmux resize-pane -R 60

tmux select-window -t 1

tmux attach

