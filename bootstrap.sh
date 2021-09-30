#!/usr/bin/env bash

# To bootstrap these dotfiles on a computer:
#
#   bash -ic "$(curl -fsSL https://raw.githubusercontent.com/couetilc/dotfiles/bootstrap/bootstrap.sh)"
#

HOMEBREW_INSTALLER='/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
GITHUB_EMAIL=couetilc@gmail.com

cmd_exists() { test -x "$(command -v "$1")"; }
file_exists() { test -f "$1"; }

# Set up the bare git repository where the dotfiles will live
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Ensure homebrew and gh are installed
if ! cmd_exists brew; then
  eval "$HOMEBREW_INSTALLER"
  eval "$(/opt/homebrew/bin/brew shellenv)" # puts "brew" in PATH
fi
if ! cmd_exists gh; then
  brew install gh
fi

# Generate a ssh key for GitHub
if ! file_exists "$HOME/.ssh/id_25519"; then
  ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -P '' -C "$GITHUB_EMAIL"
fi

# Log into GitHub to get permission to pull the dotfiles repository
gh auth login --web -s repo,write:public_key
gh ssh-key add $HOME/.ssh/id_ed25519.pub

# Pull dotfiles to the current computer
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
dotfiles pull origin main --ff-only

echo "Remember to source your .bashrc: `source ~/.bashrc`"
