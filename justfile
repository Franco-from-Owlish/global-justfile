default:
  just -g --list

# Start a new NeoVim session in the current directory with tmux split-window
nvim-dev:
  tmux new-session -A -snvim-dev \; split-window -v -l 20 \; select-pane -t 0 \; send-keys "nvim" C-m \;

update-nvim-config:
  curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/Franco-from-Owlish/astro-vim-config/main/install.sh | sh

update-global-justfile:
  curl -o ~/.config/just/justfile https://raw.githubusercontent.com/Franco-from-Owlish/global-justfile/main/justfile

deleted-merged-branches:
  # !/bin/bash 
  if [ $(git branch --show-current) != 'main']; then
    read -p "Not on main branch, are you sure you want to continue?" -n 1 -r 
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1;
    fi
  fi
  branches = $(git branch --merged | grep "^[[^*]")
  echo "The following branches will be deleted:"
  echo ${branches}
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1;
  fi
  git branch -D $(${branches} | xargs)

