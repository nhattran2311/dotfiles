#!bin/sh
#TODO: need make this script work
printGreen() {
  echo "\e[32m$1\e[0m"
}

printRed() {
  echo "\e[31m$1\e[0m"
}

FILE=~/.local/share/nvim/nvim.appimage
NVIM_FOLDER=~/.local/bin/nvim

printGreen "Install Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

printGreen "Creating folders and copying files"
cp .zshrc ~/.zshrc && mkdir -p ~/.config/nvim/ && cp -r .config/nvim/* ~/.config/nvim

printGreen "Install Packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim


printGreen "Install ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printGreen "Install starship"
curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir && cp .config/starship.toml ~/.config/starship.toml

if [ -d "~/.oh-my-zsh/custom/plugins/zsh-aliases-exa/" ]; then
    printGreen "zsh plugins is exists"
else
    git clone https://github.com/DarrinTisdale/zsh-aliases-exa ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins
fi

printGreen "Install EXA"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printGreen "Install FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install



# printGreen "Install NEOVIM........"

# printGreen "Create Nvim folder"
# mkdir -p ~/.local/share/nvim
# echo "download nvim"


# if [ -f "$FILE" ]; then
#     printRed "$FILE exits."
# else
#     printGreen "$FILE does not exits. -> download from github repo."
#     wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage -P ~/.local/share/nvim/
#     printGreen "Install Nvim"
#     chmod u+x ~/.local/share/nvim/nvim.appimage && ~/.local/share/nvim/nvim.appimage
# fi

# if [ -L "$NVIM_FOLDER" ]; then
#     printRed "Nvim Folder Already Link"
# else
#     printGreen "Link Folder Nvim"
#     mkdir -p ~/.local/bin
#     ln -s $HOME/.local/share/nvim/nvim.appimage $NVIM_FOLDER
# fi




# declare -r PWD=$(pwd)
# declare -r WHOAMI=$(whoami)
# declare -r VIM_PLUG=~/.vim/autoload/plug.vim

#################
### Setup vimrc ###
#################
# if $(hash vim); then
#     if [[ ! -f $VIM_PLUG ]]; then
#         curl  --silent -fLo $VIM_PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/main/plug.vim
#     fi
#     ln -fFs $(pwd)/vimrc ~/.vimrc
#     vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +qall

#     if $(hash go); then
#         vim ~/.vim.go +GoInstallBinaries +GoUpdateBinaries +qall
#     fi

# else
#     echo "Oops! We could not find vim on your system."
# fi



#Nvim Plugin
# printGreen "Install Nvim Plugin"
# mkdir -p ~/.config/nvim/
# cp -r .config/nvim ~/.config/nvim/*
