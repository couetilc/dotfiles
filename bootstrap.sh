#!/usr/bin/env bash

HOMEBREW_INSTALLER='/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
cmd_exists() { test -x "$(command -v "$1")"; }
USER_HOME=$HOME # in case sudo changes HOME environment variable

# To bootstrap these dotfiles on a computer:
#
#   echo "$(curl -fsSL https://raw.githubusercontent.com/couetilc/dotfiles/bootstrap/bootstrap.sh)" | source /dev/stdin
#   
# NOTE: you may need to "sudo echo ..."
#
# NOTE: we call to `source` instead of `bash -ic` to have the dotfiles alias
# defined and the appropriate rc file sourced in the current shell session

# set up the bare git repository where the dotfiles will live
git config --global init.defaultBranch 'main'
git init --bare "$USER_HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$USER_HOME/.dotfiles/ --work-tree=$USER_HOME'
dotfiles config status.showUntrackedFiles no

# ensure homebrew and gh are installed
if ! cmd_exists gh; then
  if ! cmd_exists brew; then
    echo "sudo needed to install Homebrew"
    eval "$HOMEBREW_INSTALLER"
    [ $? = 1 ] && break
    eval "$(/opt/homebrew/bin/brew shellenv)" # put "brew" in PATH
  fi
  brew install gh
fi

# Log into GitHub to get permission to pull the dotfiles repository
gh auth login --web

# pull dotfiles to the current computer
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
dotfiles pull origin main

# source the rc file for the current shell
if [ -n "$ZSH_VERSION" ]; then
  source "$USER_HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
  source "$USER_HOME/.bashrc"
fi
