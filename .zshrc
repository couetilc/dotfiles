eval "$(rbenv init -)"

export EDITOR="vim"

alias vim="nvim"
alias ec="vim $HOME/.zshrc"
alias sc="source $HOME/.zshrc"

if [[ $OSTYPE == darwin* ]]; then
alias slack="open -a /Applications/Slack.app"
alias loom="open -a /Applications/Loom.app"
alias notion="open -a /Applications/Notion.app"
alias browse="open -a /Applications/Safari.app"
alias dhub="browse https://hub.docker.com"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
