#-- return if not interactive shell --#
[[ ! $- =~ "i" ]] && return

#-- Load additional config files --#
if [ -f ~/.env ]; then
  source ~/.env
fi

#-- Load Homebrew --#
eval "$(/opt/homebrew/bin/brew shellenv)" # put brew into PATH

#-- Environment config --#
export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZE=2000
# any commands that start with a space e.g. " echo 'hello'", will not be saved
# in bash history. useful for commands like " export SECRET=password" you don't
# want saved on disk in the history
export HISTCONTROL=ignorespace

#-- Terminal options --#
set -o emacs # move around the terminal line with emacs key commands
shopt -s checkwinsize # check the window size after each command to prevent readline wrap problems

#-- Command Prompt Modifications --#
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#-- Shortened commands --#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ec="vim $HOME/.bashrc"
alias sc="source $HOME/.bashrc"

#-- Replaced commands --#
alias which='type -a'

if [ -x "$(command -v bat)" ]; then
  alias cat='bat'
else
  echo "[.bashrc] 'bat' not installed"
fi

if [ -x "$(command -v prettyping)" ]; then
  alias ping='prettyping'
else
  echo "[.bashrc] 'prettyping' not installed"
fi

if [ -x "$(command -v htop)" ]; then
  alias top='htop'
else
  echo "[.bashrc] 'htop' not installed"
fi

if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
  export EDITOR=nvim
else
  echo "[.bashrc] 'neovim' not installed"
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make less friendlier for non-text input files, see lesspipe(1)

#-- Add options for commands --#

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias ag="ag --color-path 35 --color-match '1;35' --color-line-number 32"
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias wget='wget -c'
alias mkdir='mkdir -pv'

#-- ls aliases --#
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd -F'
  alias lt='ls --tree'
else
  echo "[.bashrc] 'lsd' not installed"
  alias ls='ls -F -G -h -C'
fi

alias lsa='ls -a'
alias ll='ls -l'
alias la='ls -a -l'

#-- Mac Application aliases --#

if [[ $OSTYPE == darwin* ]]; then
alias slack="open -a /Applications/Slack.app"
alias loom="open -a /Applications/Loom.app"
alias notion="open -a /Applications/Notion.app"
alias browse="open -a /Applications/Safari.app"
alias dhub="browse https://hub.docker.com"
fi


#-- Git aliases --#
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gs="git status -sb"
alias gl="git log --pretty=oneline"
alias glp="git log --graph --pretty=format:'%C(magenta)%h%Creset%C(auto)%d%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset' --abbrev-commit"
alias gls="git log --stat"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfo="git fetch origin"
# see https://git.kernel.org/pub/scm/git/git.git/plain/contrib/completion/git-completion.bash?id=HEAD

#-- Git Tasks --#
git-clean-branches-merged-into-master() {
  # list branches mered into master | filter out worktress and checked-out branches | delete each branch
  git branch --merged master | grep -v "[+*]" | xargs git branch -d
}

#-- NPM aliases --#
alias npm-lsl="npm ls -g --depth=0 --link=true"

#-- Useful commands --#
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#-- Cute commands --#
#[1]
alias lookbusy="cat /dev/urandom | hexdump -C | grep \"34 32\""
alias ducks="du -cks -- * | sort -rn | head"

vm() {
  SSH_USER="$DEV_USER@$DEV_SERVER"
  if [ -x "$(command -v mosh)" ]; then
    mosh --server="/opt/homebrew/bin/mosh-server" "$SSH_USER"
  else
    ssh "$SSH_USER"
  fi
}

export VM_PORT_FORWARDING_PID=""

vmp() {
  # https://explainshell.com/explain?cmd=ssh+-L+-N+-f+-l+-S
  # https://unix.stackexchange.com/questions/389014/getting-a-pid-for-an-ssh-process-that-backgrounded-itself
  ssh \
    -L "5001:localhost:5001" \
    -N \
    -f \
    -M \
    -S "/tmp/.ssh-vmp" \
    "$DEV_USER@$DEV_SERVER" 
}

vmp_check() {
  ssh -S "/tmp/.ssh-vmp" -O check "$DEV_USER@$DEV_SERVER"
}

vmp_kill() {
  ssh -S "/tmp/.ssh-vmp" -O exit "$DEV_USER@$DEV_SERVER"
}

vmx() {
	ssh -i ${DEV_RSA} -l ${DEV_USER} ${DEV_SERVER} -t 'tmux attach || tmux new'
}

vmcc() {
	ssh -i ${DEV_RSA} -l ${DEV_USER} ${DEV_SERVER} -t 'tmux -CC attach'
}

pi() {
	ssh -l ${PI_USER} ${PI_SERVER} -t 'tmux attach || tmux new'
}

wk() {
  REPO=$1
  BRANCH=$2
  git worktree add "$HOME/wk/$REPO/$BRANCH" "$BRANCH"
  ls $HOME/wk/$REPO/master/.env* | xargs -n 1 -J % cp % "$HOME/wk/$REPO/$BRANCH"
  cd "$HOME/wk/$REPO/$BRANCH"
}

#-- Useful tasks --#

#update all npm packages to @latest version
npm-update-all-to-latest() {
    npm outdated | tail -n+2 | awk '{print sprintf("%s%s\n", $1, "@latest")}' | xargs -t -L1 npm i
}

#run nosql client
nosql-client() {
    docker run -p 3000:3000 mongoclient/mongoclient
}

nosql-client-update() {
    docker pull mongoclient/mongoclient
}

#-- Quality of life functions --#

#Display man page in Preview [1]
manp() {
	man -t "$@" | open -f -a /Applications/Preview.app
}

#https://github.com/chubin/wttr.in [1]
weather() {
	curl wttr.in/$1
}

# [1]
ipinfo() {
	curl ipinfo.io/$1
}

cheatsh() {
	curl cheat.sh/$1
}

coin-flip() {
    jot -r 1 0 "${1:-1}"
}

check-terminal-colors() {
  awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
  for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }
  printf "\n";
  }'
}

#-- Additional config --#

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#environment flag if .bashrc has been loaded to stop multiple loads
export IS_LOADED_BASHRC="true"

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [ -n "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)" # https://github.com/nodenv/nodenv
else
  echo "[.bashrc] 'nodenv' not installed"
fi

if [ -n "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)" # https://github.com/rbenv/rbenv
else
  echo "[.bashrc] 'rbenv' is not installed"
fi

#--- Resources ---#
#[1] https://github.com/atomantic/dotfiles/blob/master/homedir/.shellfn

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


if [ -n "$(builtin type -P go)" ]; then
  export GOPATH=$(go env GOPATH)
fi

alias pip=pip3
alias tree="tree --gitignore"

_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/opt/homebrew/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi

cs() {
  mosh ccouetil@data.cs.purdue.edu
}

xinu() {
  mosh ccouetil@xinu07.cs.purdue.edu
}

# Port forwarding: tailscale ssh connor@boots -L8080:localhost:2342 
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

eval "$(fzf --bash)"
