# dotfiles

Bootstrap dotfiles on new computer:
```sh
bash -ic "$(curl -fsSL https://raw.githubusercontent.com/couetilc/dotfiles/main/bootstrap.sh)"
./brew.sh # download cli tools using homebrew
```

Usage:
```sh
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "add vimrc"
dotfiles push
```

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

Install Nerd Fonts ([GitHub](https://github.com/ryanoasis/nerd-fonts))
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
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

Install shellcheck ([GitHub](https://github.com/koalaman/shellcheck))
```
brew install shellcheck
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

### inspiration
- https://news.ycombinator.com/item?id=11070797
- https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

### other dotfiles
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

## Tools I Use

### Visualizing Ideas / Mind Mapping

* [Kinopio](https://kinopio.club/): So cool, very flexible, pretty, fun.

#### To Explore

### Note Taking

* Notion: slows down on larger pages, like my standups.

#### To Explore

* [nvUltra](https://nvultra.com/): modal note taking tool, very fast. Evolution
  of this tool [nvalt](https://brettterpstra.com/projects/nvalt/) which was a
  fork of this tool [Notational Velocity](https://notational.net/)

### Writing

#### To Explore

* [Ulysses](https://ulysses.app/): Writing app for mac, ipad, and iphone. Minimalist
  with professionallly oriented tools integrated, such as a proofreader and editing assistant.

### Programming Languages

#### To Explore

* [Elm](https://elm-lang.org/): "A delightful language for reliable web applications"

### Api Monitoring

#### To Explore

* [Checkly](https://www.checklyhq.com/): SaaS API and E2E monitoring platform, oriented
  to modern javascript stack.
  - ref: joe

### SaaS QA Tools

#### To Explore

* [Rainforest](https://www.rainforestqa.com/): SaaS for building QA Automation
  suites on your website. (heard about from joe)
  - ref: joe

### Software Developer Portals

* [Backstage](https://backstage.spotify.com/): "Backstage is an open platform
  for building developer portals, created at Spotify, donated to the CNCF, and
  maintained by a worldwide community of contributors."
  - ref: joe

### Design Tools

- [Paletton](https://paletton.com/#) great color picker.

- [Leonardo](https://leonardocolor.io/?colorKeys=%236fa7ff&base=ffffff&ratios=3%2C4.5&mode=CAM02)
  open source contrast-based color generator for theme color systems.

### Software Development Tools

#### To Explore

- [CyberChef](https://gchq.github.io/CyberChef/) - The Cyber Swiss Army Knife.
  "CyberChef is a simple, intuitive web app for carrying out all manner of
  "cyber" operations within a web browser. These operations include simple
  encoding like XOR or Base64, more complex encryption like AES, DES and
  Blowfish, creating binary and hexdumps, compression and decompression of
  data, calculating hashes and checksums, IPv6 and X.509 parsing, changing
  character encodings, and much more."
