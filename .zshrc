export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

export ZSH_THEME="dracula"

# For mac M1
export PATH=/opt/homebrew/bin:$PATH

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

export CASE_SENSITIVE="true"

export VISUAL='nvim'
export EDITOR='nvim'

# GO
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=auto
export GOPRIVATE=''
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# alias
alias vim="vim"
alias vi="nvim"
alias v="nvim"
alias g3="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs="git status"
alias gb='git branch | fzf | xargs git checkout'
alias gac='git add . && git commit -am'
alias gd='git diff -w "$@" | view -'
alias gitc="git clone "


source $ZSH/oh-my-zsh.sh
