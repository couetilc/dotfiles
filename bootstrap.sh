#!/usr/bin/env bash

HOMEBREW_INSTALLER='/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
GITHUB_EMAIL=couetilc@gmail.com

cmd_exists() { test -x "$(command -v "$1")"; }
file_exists() { test -f "$1"; }

# To bootstrap these dotfiles on a computer:
#
#   sudo echo "$(curl -fsSL https://raw.githubusercontent.com/couetilc/dotfiles/bootstrap/bootstrap.sh)" | source /dev/stdin
#
# NOTE: we call to `source` instead of `bash -ic` to have the dotfiles alias
# defined and the appropriate rc file sourced in the current shell session

# set up the bare git repository where the dotfiles will live
git config --global init.defaultBranch 'main'
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ensure homebrew and gh are installed
if ! cmd_exists brew; then
  echo "sudo needed to install Homebrew"
  eval "$HOMEBREW_INSTALLER"
  eval "$(/opt/homebrew/bin/brew shellenv)" # put "brew" in PATH
fi
if ! cmd_exists gh; then
  brew install gh
fi


# Log into GitHub to get permission to pull the dotfiles repository
if ! file_exists "$HOME/.ssh/id_25519"; then
  ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -P '' -C "$GITHUB_EMAIL"
fi
gh auth login --web -s repo,write:public_key
gh ssh-key add $HOME/.ssh/id_ed25519.pub

# pull dotfiles to the current computer
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
dotfiles pull origin main --ff-only

## source the rc file for the current shell
#if [ -n "$ZSH_VERSION" ]; then
#  source "$HOME/.zshrc"
#elif [ -n "$BASH_VERSION" ]; then
#  source "$HOME/.bashrc"
#fi
