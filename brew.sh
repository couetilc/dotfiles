#!/usr/bin/env bash

# Install my basic cli tools using Homewbrew
# (thank you https://raw.githubusercontent.com/mathiasbynens/dotfiles/main/brew.sh)

# Use the latest Homebrew version
brew update

# Upgrade any existing formulas
brew upgrade

# Save Homebrew's installed location
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the build-in `sed`.
brew install gnu-sed # --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` (with IRI support not working).
brew install wget # --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
#brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Connor's stuff
brew install neovim
brew install nodenv
brew install mosh
brew install fd
brew install lsd
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install the_silver_searcher
brew install bat
brew install tmux
brew install --cask docker
softwareupdate --install-rosetta # for docker
brew install shellcheck
brew install sops
brew install rbenv
brew install htop
brew install prettyping
brew install postgresql
brew install ripgrep
brew install fzf # https://github.com/junegunn/fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc # install useful key bindings and fuzzy completion
brew install cloc # https://github.com/AlDanial/cloc
brew install --cask flameshot # https://github.com/flameshot-org/flameshot

# Remove outdated versions from the cellar
brew cleanup
