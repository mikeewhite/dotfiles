# dotfiles

A collection of dotfiles and scripts for bootstrapping a MacOS development environment.

## Pre-requisites
1. Check `git` is installed/working
    1. XCode command line tools might need installing
1. Setup an SSH key for `git`
    1. See https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
1. Install `brew`
    1. See https://brew.sh/
1. Install [iTerm2](https://iterm2.com/)
    1. `brew install --cask iterm2`

## Setup
1. Open iTerm2
1. Clone this repo and `cd` into the repo root
1. Run `./bootstrap.sh` which will:
    1. Install [oh-my-zsh](https://ohmyz.sh/)
    1. Install [powerlevel10k](https://github.com/romkatv/powerlevel10k) zsh theme
    1. Install [asdf](https://asdf-vm.com/) version manager and associated plugins
    1. Install tooling (such as Go, Java, and NodeJS) via `asdf` at the pinned versions specified in the `.tool-versions` file)
    1. Symlink dotfiles in your home directory to the version controlled equivalents in this repo.
    1. Install [VSCode](https://code.visualstudio.com/)
    1. Install [Sourcetree](https://www.sourcetreeapp.com/)
1. Restart terminal
1. Run `p10k configure` and install `Meslo Nerd Font`
    1. Quit terminal when prompted

## Usage
1. Run `bump_dot_files` to commit changes to dotfiles.
