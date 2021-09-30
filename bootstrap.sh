# /bin/bash -c "$(curl -fsSL https://
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
