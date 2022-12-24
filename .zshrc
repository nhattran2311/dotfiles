# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
#    source ~/.profile
#fi
TERM=xterm-256color
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$(( 1.2 * SAVEHIST )) # Zsh recommended value
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_FIND_NO_DUPS HIST_VERIFY
ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-autosuggestions
  z
  docker
  docker-compose
  tmux
  kubectl
  zsh-aliases-exa
)

alias sde='docker-compose build --pull dev-env && docker-compose run --rm dev-env'
alias ls='exa --icons --colour=always -l'
alias lst='exa --icons --colour=always --tree --level=2 -l'
alias gne='git add . && git commit --amend --no-edit && git push -f'
alias gdb='git branch | grep -v "develop" | grep -v "master" | xargs git branch -D'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5,underline'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word
bindkey '^b'   backward-word

# load customisation environment variables if available
[[ ! -f ~/.env ]] || source ~/.env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
source $ZSH/oh-my-zsh.sh
# keep this line below oh-my-zsh
eval "$(starship init zsh)"


groups_list() {
# usage: 
#   groups_list -> list groups for current user
#   groups_list <user>  -> list groups for specific user
    
    user=$1
    for i in $(id -G $user);do echo "$(getent group $i | cut -d: -f1)" ;done
}
