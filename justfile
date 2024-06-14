default:
  just -g --list

nvim-dev *args:
  cd {{args}} || true
  tmux new-session -A -snvim-dev \; split-window -v -l 20 \; select-pane -t 0 \; send-keys "nvim" C-m \;

