#!bin/sh
printGreen() {
  echo "\e[32m$1\e[0m"
}

printRed() {
  echo "\e[31m$1\e[0m"
}

FILE=~/.local/share/nvim/nvim.appimage
NVIM_FOLDER=~/.local/bin/nvim


printGreen "Install NEOVIM........"
sudo apt install


printGreen "Create Nvim folder"
mkdir -p ~/.local/share/nvim
echo "download nvim"


if [ -f "$FILE" ]; then
    printRed "$FILE exits."
else
    printGreen "$FILE does not exits. -> download from github repo."
    wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage -P ~/.local/share/nvim/
    printGreen "Install Nvim"
    chmod u+x ~/.local/share/nvim/nvim.appimage && ~/.local/share/nvim/nvim.appimage
fi

if [ -L "$NVIM_FOLDER" ]; then
    printRed "Nvim Folder Already Link"
else
    printGreen "Link Folder Nvim"
    mkdir -p ~/.local/bin
    ln -s $HOME/.local/share/nvim/nvim.appimage $NVIM_FOLDER
fi




#copy .profile and .bashrc
cp .bashrc ~/.bashrc
#cp .profile ~/.profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    . ~/.profile
fi


#Nvim Plugin
printGreen "Install Nvim Plugin"
mkdir -p ~/.config/nvim/
cp -r .config/nvim ~/.config/nvim/*

printGreen "Install Vimplug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'



sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc


if [ -d "~/.oh-my-zsh/custom/plugins/zsh-aliases-exa/" ]; then
    printGreen "already checkout this repo"
else
    printGreen "does not checkout this repo"
    git clone https://github.com/DarrinTisdale/zsh-aliases-exa ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins
    . ~/.zshrc
fi

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    printGreen "already install p10k"
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  . ~/.zshrc
fi


#install exa
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install build-essential
cargo install exa


#install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
. ~/.zshrc