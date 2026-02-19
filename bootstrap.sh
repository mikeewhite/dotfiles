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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo -e "🛠️ ${GREEN} Installing asdf version manager (see https://asdf-vm.com/guide/getting-started.html)${NC}"
brew install asdf

echo -e "🛠️ ${GREEN} Installing asdf go plugin (see https://github.com/asdf-community/asdf-golang)${NC}"
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git

echo -e "🛠️ ${GREEN} Installing asdf golangci-lint plugin (see https://github.com/hypnoglow/asdf-golangci-lint)${NC}"
asdf plugin add golangci-lint https://github.com/hypnoglow/asdf-golangci-lint.git

echo -e "🛠️ ${GREEN} Installing asdf kubectl plugin (see https://github.com/asdf-community/asdf-kubectl)${NC}"
asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git

echo -e "🛠️ ${GREEN} Installing asdf nodejs plugin (see https://github.com/asdf-vm/asdf-nodejs)${NC}"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

echo -e "🛠️ ${GREEN} Installing asdf yarn plugin (see https://github.com/twuni/asdf-yarn)${NC}"
asdf plugin add yarn

echo -e "🛠️ ${GREEN} Installing asdf buf plugin (see https://github.com/truepay/asdf-buf)${NC}"
asdf plugin add buf https://github.com/truepay/asdf-buf

echo -e "🛠️ ${GREEN} Installing VSCode IDE (see https://code.visualstudio.com/)${NC}"
brew install --cask visual-studio-code

echo -e "🛠️ ${GREEN} Installing FiraCode font (required for font ligatures in VSCode - see https://github.com/tonsky/FiraCode/wiki/Installing)${NC}"
brew install --cask font-fira-code

echo -e "🛠️ ${GREEN} Installing Rectangle window manager (see https://rectangleapp.com/)${NC}"
brew install --cask rectangle

echo -e "🛠️ ${GREEN} Installing OpenLens (see https://github.com/lensapp/lens)${NC}"
brew install --cask openlens

echo -e "🛠️ ${GREEN} Installing GitHub CLI (see https://cli.github.com/)${NC}"
brew install gh

symlink_dotfile ".aliases"
symlink_dotfile ".functions"
symlink_dotfile ".tool-versions"
symlink_dotfile ".vimrc"
symlink_dotfile ".zshrc"

FILE="${HOME}/.sensitive"
if [ ! -f "${FILE}" ]; then
    echo -e "🛠️ ${GREEN} Creating ${FILE}${NC}"
    touch ${FILE}
    echo "# Add any secrets or sensitive content here that should not be added to source control" > ${FILE}
fi

echo -e "🛠️ ${GREEN} Installing tooling via asdf (${FILE})${NC}"
asdf install

echo -e "🛠️ ${GREEN} Installing GitHub CLI extensions${NC}"
gh extension install seachicken/gh-poi
