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
export PATH="$HOME/.local/bin:$PATH"

###############################################################
# 1Password
###############################################################
eval "$(op completion zsh)"; compdef _op op

###############################################################
# asdf
###############################################################
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

###############################################################
# github
###############################################################
# Use vim as the editor for the GitHub CLI
export EDITOR=vim

###############################################################
# go
###############################################################
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
export GOPRIVATE=buf.build/gen/go

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
