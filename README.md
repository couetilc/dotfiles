# dotfiles

Bootstrap dotfiles on new computer:
```sh
# to initialize repository:
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
# to download dotfiles:
dotfiles remote add origin git@github.com:couetilc/dotfiles.git
dotfiles checkout main
```

Usage:
```sh
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "add vimrc"
dotfiles push
```

(inspiration)
- https://news.ycombinator.com/item?id=11070797
- https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

## CLI software setup

Install HomeBrew ([Website](https://brew.sh/) - [GitHub](https://github.com/Homebrew/brew))
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install GitHub CLI ([Website](https://cli.github.com/) - [GitHub](https://github.com/cli/cli))
```
brew install gh
```

Install Neovim ([Website](https://neovim.io/) - [GitHub](https://github.com/neovim/neovim))
```
brew install neovim
```

Install Nodenv ([GitHub](https://github.com/nodenv/nodenv))
```
brew install nodenv
```

Install mosh ([Website](https://mosh.org/) - [GitHub](https://github.com/mobile-shell/mosh))
```
brew install mosh
```

Install fd ([GitHub](https://github.com/sharkdp/fd))
```
brew install fd
```

Install lsd ([GitHub](https://github.com/Peltoche/lsd))
```
brew install lsd
```

Install ag ([Website](https://geoff.greer.fm/ag/) - [GitHub](https://github.com/ggreer/the_silver_searcher))
```
brew install the_silver_searcher
```

Install bat ([GitHub](https://github.com/sharkdp/bat))
```
brew install bat
```

Install tmux ([Wiki](https://github.com/tmux/tmux/wiki) - [GitHub](https://github.com/tmux/tmux/))
```
brew install tmux
# NOTE tmux plugin manager "tpm" https://github.com/tmux-plugins/tpm
```

## Mac software setup

Install 1Password 6 (from iCloud > Documents > software > 1Password-6.X.X.pkg)

Install iTerm2 ([Website](https://iterm2.com/))

Install Magnet ([Website](https://magnet.crowdcafe.com/))

Install Docker ([Website](https://docs.docker.com/get-docker/))

Install Classic 1Password Extensions ([Website](https://support.1password.com/cs/1password-classic-extension/))

Install ItsyCal ([Website](https://www.mowglii.com/itsycal/))

Install App Cleaner ([Website](https://freemacsoft.net/appcleaner/))

## To explore

htop ([Website](https://htop.dev/) - [GitHub](https://github.com/htop-dev/htop))

diff-so-fancy ([GitHub](https://github.com/so-fancy/diff-so-fancy))

prettyping ([Website](https://denilson.sa.nom.br/prettyping/) - [GitHub](https://github.com/denilsonsa/prettyping))

git-annex ([Website](https://git-annex.branchable.com/))

etckeeper ([Website](https://etckeeper.branchable.com/))

## Resources

Good overall configuration of many CLI tools.
https://github.com/kutsan/dotfiles

Simple organization and way of installing configuration for OS and software programs
https://github.com/nicksp/dotfiles

Hardcore config
https://github.com/posquit0/dotfiles

Very comprehensive list of many types of dotfiles
https://github.com/voku/dotfiles

Check this out
https://github.com/mathiasbynens/dotfiles

