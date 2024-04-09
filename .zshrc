# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin/:$HOME/.cargo/bin:/usr/local/go/bin:$PATH

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
TERM=xterm-256color
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$(( 1.2 * SAVEHIST )) # Zsh recommended value
export HISTTIMEFORMAT="[%F %T] "
autoload -Uz compinit && compinit
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_FIND_NO_DUPS HIST_VERIFY HIST_IGNORE_ALL_DUPS
ENABLE_CORRECTION="true"
# load customisation environment variables if available
[[ ! -f ~/.env ]] || source ~/.env

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  z
  docker
  docker-compose
  tmux
  kubectl
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


alias sde='docker-compose build --pull dev-env && docker-compose run --rm dev-env'
alias ls='exa --icons --colour=always -l'
alias lst='exa --icons --colour=always --tree --level=2 -l'
alias gne='git add . && git commit --amend --no-edit && git push -f'
alias gdb='git branch | grep -v "develop" | grep -v "master" | xargs git branch -D'
alias kubectl="minikube kubectl --"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5,underline'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word
bindkey '^b'   backward-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --preview 'cat {}' --border --margin=1"
eval "$(starship init zsh)"

export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
groups_list() {
# usage:
#   groups_list -> list groups for current user
#   groups_list <user>  -> list groups for specific user

    user=$1
    for i in $(id -G $user);do echo "$(getent group $i | cut -d: -f1)" ;done
}
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
