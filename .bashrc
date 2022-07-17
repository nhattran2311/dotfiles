# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

# fix wsl2 network issue on windows 11 machines
#echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null