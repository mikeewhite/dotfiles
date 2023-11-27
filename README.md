# dotfiles

A collection of dotfiles and scripts for bootstrapping a MacOS development environment including the following tooling:
* [oh-my-zsh](https://ohmyz.sh/) - zsh config manager
* [powerlevel10k](https://github.com/romkatv/powerlevel10k) - zsh theme
* [asdf](https://asdf-vm.com/) - version manager
* [VSCode](https://code.visualstudio.com/) - IDE
* [Sourcetree](https://www.sourcetreeapp.com/) - Git GUI
* [Rectangle](https://rectangleapp.com/) - Window manager

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
1. Run `./bootstrap.sh`
1. Restart terminal
1. Run `p10k configure` and install `Meslo Nerd Font`
    1. Quit terminal when prompted
1. Open VSCode:
    1. Enable launching from the command line (https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)
    1. Sign in and enable settings sync.
