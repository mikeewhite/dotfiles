# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

source ~/.aliases
source ~/.functions
source ~/.sensitive
source ~/.90poe

###############################################################
# 1Password
###############################################################
eval "$(op completion zsh)"; compdef _op op

###############################################################
# asdf
###############################################################
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

###############################################################
# gcloud
###############################################################
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

###############################################################
# github
###############################################################
# Use vim as the editor for the GitHub CLI
export EDITOR=vim

###############################################################
# go
###############################################################
export GOROOT="$HOME/.asdf/installs/golang/1.23.1/go"
export GOPATH="$HOME/.asdf/installs/golang/1.23.1/packages"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT
export GOPRIVATE=buf.build/gen/go

###############################################################
# powerlevel10k
###############################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLVL10K_SCRIPT_LOCATION="$(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme"
source ${POWERLVL10K_SCRIPT_LOCATION}

##############################################################
# python
##############################################################
eval "$(pyenv init --path)"

