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
source ~/.bugsnag

###############################################################
# asdf
###############################################################
. /usr/local/opt/asdf/libexec/asdf.sh

###############################################################
# gcloud
###############################################################
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

###############################################################
# go
###############################################################
export GOROOT="$HOME/.asdf/installs/golang/1.20.3/go"
export GOPATH="$HOME/.asdf/installs/golang/1.20.3/packages"
export GOPRIVATE=github.com/bugsnag
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT

###############################################################
# rbenv
###############################################################
eval "$(rbenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
