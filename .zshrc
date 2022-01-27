# Aliases
alias pip="pip3"
alias python="python3"
alias zshrc="nvim ~/.zshrc"
alias gamma="cd ~/go/src/github.com/epifi/gamma"
alias protos="cd ~/go/src/github.com/epifi/protos"
alias go-learn="cd ~/go/src/github.com/sainad2222/go-learnings"
alias vim="nvim"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Paths
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

# MISC
export CLICOLOR=1

# For starship
eval "$(starship init zsh)"

export PATH="/usr/local/opt/go@1.14/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export GOPRIVATE=github.com/epifi/* #Ignore epifi private modules which not available in go checksum databaase

# Functions
mkdircd(){
    mkdir $1
    cd $1
}

remove_lines_with_pattern(){
    while read -r a; do
        if ! grep -q "$1" <<< "$a";then
            echo $a
        fi
    done
}
export ZSH="$HOME/.oh-my-zsh"
plugins=(git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

export GOPATH=/Users/sainath/go
export GOROOT=/usr/local/go
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh autosuggestions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh
