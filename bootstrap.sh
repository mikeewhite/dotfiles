#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

symlink_dotfile() {
    FILE=$1
    echo -e "🛠️ ${GREEN} Symlinking ${HOME}/${FILE}${NC}"
    if [ -f "${HOME}/${FILE}" ]; then
        echo -e "${ORANGE} 📄 ${HOME}/${FILE} already exists. Renaming old file to ${HOME}/${FILE}.pre-bootstrap${NC}"
        mv "${HOME}/${FILE}" "${HOME}/${FILE}.pre-bootstrap"
    fi
    ln -s "${PWD}/${FILE}" ${HOME}/${FILE}
}

echo -e "🛠️ ${GREEN} Installing oh-my-zsh (see https://ohmyz.sh/#install)${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "🛠️ ${GREEN} Installing powerlevel10k (see https://github.com/romkatv/powerlevel10k#oh-my-zsh)${NC}"
brew install romkatv/powerlevel10k/powerlevel10k

echo -e "🛠️ ${GREEN} Installing asdf version manager (see https://asdf-vm.com/guide/getting-started.html)${NC}"
brew install asdf

echo -e "🛠️ ${GREEN} Installing asdf go plugin (see https://github.com/kennyp/asdf-golang)${NC}"
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

echo -e "🛠️ ${GREEN} Installing asdf golangci-lint plugin (see https://github.com/hypnoglow/asdf-golangci-lint)${NC}"
asdf plugin add golangci-lint https://github.com/hypnoglow/asdf-golangci-lint.git

echo -e "🛠️ ${GREEN} Installing asdf java plugin (see https://github.com/halcyon/asdf-java)${NC}"
asdf plugin-add java https://github.com/halcyon/asdf-java.git

echo -e "🛠️ ${GREEN} Installing asdf kubectl plugin (see https://github.com/asdf-community/asdf-kubectl)${NC}"
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git

echo -e "🛠️ ${GREEN} Installing asdf mongodb plugin (see https://github.com/sylph01/asdf-mongodb)${NC}"
asdf plugin-add mongodb https://github.com/sylph01/asdf-mongodb.git

echo -e "🛠️ ${GREEN} Installing asdf nodejs plugin (see https://github.com/asdf-vm/asdf-nodejs)${NC}"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

symlink_dotfile ".aliases"
symlink_dotfile ".functions"
symlink_dotfile ".mongorc.js"
symlink_dotfile ".p10k.zsh"
symlink_dotfile ".tool-versions"
symlink_dotfile ".vimrc"
symlink_dotfile ".zshrc"

FILE="${HOME}/.sensitive"
if [ ! -f "${FILE}" ]; then
    echo -e "🛠️ ${GREEN} Creating ${FILE}${NC}"
    touch ${FILE}
    echo "# Add any secrets or sensitive content here that should not be added to source control" > ${FILE}
fi

FILE="${HOME}/.bugsnag"
if [ ! -f "${FILE}" ]; then
    echo -e "🛠️ ${GREEN} Creating ${FILE}${NC}"
    touch ${FILE}
    echo "# See https://github.com/mikeewhite/bugsnag-dotfiles" > ${FILE}
fi

echo -e "🛠️ ${GREEN} Installing tooling via asdf (${FILE})${NC}"
asdf install

echo -e "🛠️ ${GREEN} Installing VSCode IDE (see https://code.visualstudio.com/)${NC}"
brew install --cask visual-studio-code

echo -e "🛠️ ${GREEN} Installing FiraCode font (required for font ligatures in VSCode - see https://github.com/tonsky/FiraCode/wiki/Installing)${NC}"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

echo -e "🛠️ ${GREEN} Installing sourcetree Git GUI (see https://www.sourcetreeapp.com/)${NC}"
brew install --cask sourcetree

echo -e "🛠️ ${GREEN} Installing Rectangle window manager (see https://rectangleapp.com/)${NC}"
brew install --cask rectangle
echo -e "🛠️ ${GREEN} Starting Rectangle window manager${NC}"
open -a Rectangle

echo -e "🛠️ ${GREEN} Installing Mac App Store CLI (see https://github.com/mas-cli/mas)${NC}"
brew install mas

echo -e "🛠️ ${GREEN} Installing Trello (see https://trello.com/)${NC}"
mas lucky trello

echo -e "🛠️ ${GREEN} Installing Horo timer via Mac App store (see https://matthewpalmer.net/horo-free-timer-mac/)${NC}"
mas lucky horo
open -a Horo