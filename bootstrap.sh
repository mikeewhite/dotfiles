#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "🛠️ ${GREEN} Installing oh-my-zsh (see https://ohmyz.sh/#install)${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "🛠️ ${GREEN} Installing powerlevel10k (see https://github.com/romkatv/powerlevel10k#oh-my-zsh)${NC}"
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

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

FILE="${HOME}/.tool-versions"
echo -e "🛠️ ${GREEN} Symlinking asdf global default versions (${FILE})${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.tool-versions" ${FILE}
fi

echo -e "🛠️ ${GREEN} Installing tooling via asdf (${FILE})${NC}"
asdf install

FILE="${HOME}/.aliases"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.aliases" ${FILE}
fi

FILE="${HOME}/.functions"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.functions" ${FILE}
fi

FILE="${HOME}/.mongorc.js"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.mongorc.js" ${FILE}
fi

FILE="${HOME}/.p10k.zsh"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.p10k.zsh" ${FILE}
fi

FILE="${HOME}/.vimrc"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.vimrc" ${FILE}
fi

FILE="${HOME}/.zshrc"
echo -e "🛠️ ${GREEN} Symlinking ${FILE}${NC}"
if [ -f "${FILE}" ]; then
    echo -e "${FILE} already exists"
else
    ln -s "${PWD}/.zshrc" ${FILE}
fi

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

echo -e "🛠️ ${GREEN} Installing VSCode IDE (see https://code.visualstudio.com/)${NC}"
brew install --cask visual-studio-code

echo -e "🛠️ ${GREEN} Installing sourcetree Git GUI (see https://www.sourcetreeapp.com/)${NC}"
brew install --cask sourcetree
