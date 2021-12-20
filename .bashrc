#sudo service cntlm start

# CNTLM Proxy settings
#export http_proxy="http://localhost:3128"
#export https_proxy="http://localhost:3128"
#export ftp_proxy="http://localhost:3128"
#export no_proxy='localhost, 127.0.0.*, 192.168.*, .local, 172.*, *.bosch.*'


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
export CONTAINER_UID=$(id -u) && export CONTAINER_GID=$(id -g) && export CONTAINER_USER=$(whoami)

# fix wsl2 network issue
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

alias sde='docker-compose build --pull dev-env && docker-compose run --rm dev-env'

alias gcf='git add . -u && git commit --amend --no-edit && git push -f'
alias ls='exa --icons --colour=always --tree --level=2 -l'
