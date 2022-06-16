# Aliases
alias pip="pip3"
alias python="python3"
alias zshrc="nvim ~/.zshrc"
alias vimrc="cd ~/.config/nvim && vim"
alias gamma="cd ~/go/src/github.com/epifi/gamma"
alias protos="cd ~/go/src/github.com/epifi/protos"
alias sherlock="cd ~/go/src/github.com/epifi/Sherlock"
alias go-learn="cd ~/go/src/github.com/sainad2222/go-learnings"
alias vim="nvim"
alias vimpy="cd ~/edu && vim test.py"
alias vimcpp="cd ~/edu && vim test.cpp"
alias vimgo="cd ~/edu/go_test && vim main.go"
alias dc="docker-compose"
alias kill_background_jobs="jobs -p | grep -o -E '\s\d+\s' | xargs kill"

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
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.config/scripts"
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

sync_dots(){
    cd $HOME
    echo "Updating brewlist..."
    brew list > $HOME/.config/homebrew/brew.list
    function dotfiles(){
        /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
    }
    files=$(dotfiles status --porcelain | awk '{ print $2 }')
    echo $files
    echo $files | while read -r file; do
        dotfiles add $file
    done
    echo "Enter a commit message"
    read commit_msg
    dotfiles commit -m $commit_msg
    dotfiles push
    echo "DONE"
}

fix_sherlock(){
    file='server/grpc/utils.js'
    sed -i '' "s/createSsl/abcDefghi/g" "$file"
    sed -i '' "s/createInsecure/createSsl/g" "$file"
    sed -i '' "s/abcDefghi/createInsecure/g" "$file"
}

rebase(){
    git checkout master
    git pull origin master
    git checkout -
    git rebase master
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
