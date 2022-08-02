# Startup with Tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux || tmux new
fi

# Startup with P10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=$ZSH/custom
ZSH_THEME="powerlevel10k/powerlevel10k"


# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty/kitty.conf"

# ZSH Plugins
plugins=(
    git
    docker
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Export Global Environments Variable
export VISUAL='nvim'
export EDITOR='nvim'
export HOMEBREW_NO_AUTO_UPDATE=1
# export LANG=en_US.UTF-8

# Custom binary file (ubuntu)
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

 #AWS path
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# SSH path
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# GO path
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache
export GO111MODULE=auto
export GOPRIVATE=''
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# DOCKER CONFIG
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# P10K config
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
POWERLEVEL9K_DIR_MAX_LENGTH=1
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
ZLE_RPROMPT_INDENT=0
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Alias Script
alias kitty-config="vi $HOME/.config/kitty/"
alias tmx="tmux source-file ~/.tmux.conf"
alias vim="nvim"
alias vi="nvim"
alias g3="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs="git status"
alias gb='git branch | fzf | xargs git checkout'
alias gac='git add . && git commit -am'
alias grh='git reset --hard HEAD~1'
alias bns='cd go/src/gitlab.com/botnoi-sme'
alias bnc='cd go/src/gitlab.com/botnoi-mdcu'
alias gpl='git pull origin'
alias gps='git push origin'
alias gd='git diff -w "$@" | view -'
alias envheroku='export $(cd ~ && bns && cd bn-env && cat .env.develop | xargs)'
alias envdevelop='export $(cd ~ &&  bns && cd bn-env && cat .env.develop | xargs)'
alias envstaging='export $(cd  ~ && bns && cd bn-env && cat .env.staging | xargs)'
alias envprod='export $(export $(cd  ~ && bns && cd bn-env && cat .env.production | xargs)'
alias gitc="git clone "
alias dt="nvim $HOME/dotfiles"
# alias tkill = "tmux kill-window"


# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


source ~/powerlevel10k/powerlevel10k.zsh-theme

