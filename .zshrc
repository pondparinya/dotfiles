export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

export ZSH_THEME="dracula"

# For mac M1
export PATH=/opt/homebrew/bin:$PATH

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-completions
)

export CASE_SENSITIVE="true"

export VISUAL='nvim'
export EDITOR='nvim'

# GO
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=auto
export GOPRIVATE='go.kbtg.tech'
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
alias gopathpwd='export GOPATH=$PWD'
alias gomodoff='export GO111MODULE="off"'
alias gomodon='export GO111MODULE="on"'
alias golibtool='export C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/homebrew/include && export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/libtool/lib'

# source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/dracula/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
source $ZSH/oh-my-zsh.sh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/parinya.sa/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
