# To bootstrap these dotfiles on a computer:
#
#   echo "$(curl -fsSL https://raw.githubusercontent.com/couetilc/dotfiles/bootstrap/bootstrap.sh)" | source /dev/stdin
#
# NOTE: we call to `source` instead of `bash -ic` to have the dotfiles alias
# defined and the appropriate rc file sourced in the current shell session

git config --global init.defaultBranch 'main'
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
# TODO this fails because I do not have read permission yet for the origin.
# I need to login to github's cli. which means downloading homebrew then
# `brew install gh && gh auth:login` or whatever.
dotfiles pull origin main

if [ -n "$ZSH_VERSION" ]; then
  source $HOME/.zshrc
elif [ -n "$BASH_VERSION" ]; then
  source $HOME/.bashrc
fi
