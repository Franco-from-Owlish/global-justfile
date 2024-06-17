default:
  just -g --list

# Start a new NeoVim session in the current directory with tmux split-window
nvim-dev:
  tmux new-session -A -snvim-dev \; split-window -v -l 20 \; select-pane -t 0 \; send-keys "nvim" C-m \;

update-nvim-config:
  curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/Franco-from-Owlish/astro-vim-config/main/install.sh | sh

