#!bin/bash
# dotfile installer
#TODO: need make this script work
printGreen() {
  echo "\e[32m$1\e[0m"
}

printRed() {
  echo "\e[31m$1\e[0m"
}

FILE=~/.local/share/nvim/nvim.appimage
NVIM_FOLDER=~/.local/bin/nvim

# printGreen "Install Rust"
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# source "$HOME/.cargo/env"

printGreen "ohmyzsh Installing..."
ohmyzsh_error=$(wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true)
if [ -z "$ohmyzsh_error" ]; then
  printGreen "Ohmyzsh installation successful"
fi

printGreen "Creating folders and copying files"
cp .zshrc ~/.zshrc && mkdir -p ~/.config/nvim/ && mkdir -p ~/.local/share/nvim && cp -r .config/nvim/* ~/.config/nvim 

printGreen "Starship Installing"
for i in $(seq 1 2)
do
  starship_error=$(curl -sS https://starship.rs/install.sh | sh -s -- -y | grep -q 'Permission denied') 
  printRed "$starship_error"
  if [ -z "$starship_error" ]; then
    printGreen "Starship installation successful"
    printGreen "Copying startship config"
    cp .config/starship.toml ~/.config/starship.toml
    break
  else
    printGreen "Change Owner tmp folder" 
    sudo chmod 777 /tmp/
  fi
done

if [ -d "~/.oh-my-zsh/custom/plugins/zsh-aliases-exa/" ]; then
    printGreen "zsh plugins is exists"
else
    git clone https://github.com/DarrinTisdale/zsh-aliases-exa ~/.oh-my-zsh/custom/plugins/zsh-aliases-exa
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

printGreen "FZF Installing..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo "Y Y Y" | ~/.fzf/install

printGreen "NEOVIM Installing..."
if [ -f "$FILE" ]; then
    printRed "$FILE exists."
else
    printGreen "$FILE does not exits. -> download from github repo."
    wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage -P ~/.local/share/nvim/
    chmod u+x ~/.local/share/nvim/nvim.appimage && ~/.local/share/nvim/nvim.appimage --headless -es
fi

if [ -L "$NVIM_FOLDER" ]; then
    printRed "Nvim folder already linked"
else
    printGreen "Create link to nvim folder "
    mkdir -p ~/.local/bin
    ln -s $HOME/.local/share/nvim/nvim.appimage $NVIM_FOLDER
fi
PWD=$(pwd)
WHOAMI=$(whoami)
PAKCER=~/.local/share/nvim/site/pack/packer/start/packer.nvim
##################
###Setup PACKER###
##################
if nvim >/dev/null; then
    if [[ ! -f $PAKCER ]]; then
        printGreen "Packer Installing..."
        git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    fi
    nvim +PackerClean +PackerInstall +PlugUpdate +qall
else
    echo "Oops! We could not find neovim on your system."
fi
