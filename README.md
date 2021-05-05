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

## Software setup

Install HomeBrew (https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install GitHub CLI (https://github.com/cli/cli)
```
brew install gh
```

Install Neovim
```
brew install neovim
```


# OLD README STUFF BELOW

## Tmux setup
- install https://github.com/tmux-plugins/tpm
```bash
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
- then copy over .tmux.conf from dotfiles repo
```bash
cp ~/dotfiles/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
```
- open up .tmux.conf in tmux and pres "<C-b> I" to install 


## Vim setup

### install vim 8.1

https://www.vim.org/git.php

https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
(after install run `hash -r` to update bash's command cache)

```bash
git clone https://github.com/vim/vim.git
cd vim/src
make distclean
make
sudo make install
```

### configure vim plugins

```bash
npm i -g typescript #for tsserver used in ALE code completion
```

## What I've installed

Mac
- Brew
- Java SDK (https://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html#javasejdk)
- XQuartz
- NVM
- iTerm2
	enable option "Applications in terminal may access clipboard" in Preferences -> General

Debian
	sudo apt-get update && sudo apt-get install bat prettyping htop

Vim Plugins
	Step 0: Update Vim to version 8+
		
	Step 1: Install Vundle
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	Step 2: Run :PluginInstall

	Plugin List
		vim-fugitive
		vim-NERDTREE

Command Line Utilities
	Brew - https://brew.sh/
    Nerd Fonts (https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md)
    fd (https://github.com/sharkdp/fd)
    lsd (https://github.com/Peltoche/lsd)
    ag (https://geoff.greer.fm/ag/)
		bat
		diff-so-fancy
		htop
		prettyping
		tmux
    hub (https://github.com/github/hub)
		zeromq (for IJavascript)
		pkg-config (for IJavascript)
	Miniconda - https://conda.io/miniconda.html
		pyzmq (for IJavascript)
		jupyter
			IJupyter (Node.js in Jupyter - https://github.com/n-riesco/ijavascript)
			Notes install
				1) conda install jupyter
				2) conda create --name notes jupyter
				3) conda activate notes
	NPM
		ijavascript (Install with python2 as default, for IJavascript, then run 'ijsinstall' or 'node node_modules/ijavascript/bin/ijsinstall.js')
  Good Ones
    - git-annex https://git-annex.branchable.com/
          - gitlab integrates git-annex https://docs.gitlab.com/ee/administration/git_annex.html
    - etckeeper https://etckeeper.branchable.com/


## Installing on a new computer

0. Enable iCloud
0. Install 1Password 6 from https://1password.com/downloads/mac/
0. Install iTerm2
1. Clone this repo
```sh
git clone https://github.com/couetilc/dotfiles.git
```
4. in iTerm2 Preferences, click on "Profiles" then "Colors" and select "Solarized Dark" from the "Color Presets..." dropdown.
5. Copy over private key for work from 1Password and update permissions using `chmod 600`
7. Install `brew` from https://brew.sh/
7. Install `mosh` using `brew install mosh`
2. Install Vim and Vim Plugins (VIM 8.1 is already installed on newer macs and cannot install plugins until I `make install` dotfiles)
2. Install Vundle (https://github.com/VundleVim/Vundle.vim)
3. Run `make install` from dotfiles
9. Install Nerd Fonts https://github.com/ryanoasis/nerd-fonts
  - run `brew tap homebrew/cask-fonts` and `brew cask install font-hack-nerd-font`

* Download "Magnet" from AppStore
* Download "ItsyCal" from https://www.mowglii.com/itsycal/
* Download "App Cleaner" from https://freemacsoft.net/appcleaner/

Work Setup
1. Download Cisco Anyconnect for Ascential ("myvpn-ny.ascential.com")
2. Create a `~/.env` file and fill with values
```
export DEV_RSA=""
export DEV_USER=""
export DEV_SERVER=""
```

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

