# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Function to source a file if it exists
source_if_exists() {
  if [ -f "$1" ]; then
    if ! source "$1"; then
      echo "Warning: Failed to source $1" >&2
    fi
  fi
}

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom
export ZSH_THEME="robbyrussell"

# Plugins
# ==============================================================================================
source_if_exists "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source_if_exists "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source_if_exists "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
# ==============================================================================================

# Custom Oh My Zsh Configurations
source_if_exists ~/.zshrc_ohmyzsh_custom

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Environment Variables
export EDITOR='nvim'
export VISUAL='nvim'

# Aliases Default
alias v="nvim"
alias vi="nvim"
# Aliases Custom
source_if_exists ~/.zshrc_aliases

# Go Configuration
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOCACHE=$HOME/.cache/go
export GO111MODULE=auto

# History Configuration
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
setopt EXTENDED_HISTORY       # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS   # Don't old duplicates entries
setopt HIST_FIND_NO_DUPS      # Don't display duplicates
setopt HIST_IGNORE_SPACE      # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicates
setopt SHARE_HISTORY          # Share history between sessions


# Custom Extensions
source_if_exists ~/.zshrc_extensions
