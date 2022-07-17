# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# 
TERM=xterm-256color
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$(( 1.2 * SAVEHIST )) # Zsh recommended value
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_FIND_NO_DUPS HIST_VERIFY
ENABLE_CORRECTION="true"
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220}...%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
    print ""
    bold="%B"
    normal="%b"
    print -P "%F{220}${bold}Please ensure the default packages are installed:%f${normal}"
    print -P "%F{33}  sudo apt install autojump fonts-powerline fonts-firacode%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


# load customisation environment variables if available
[[ ! -f ~/.env ]] || source ~/.env

export ZSH="/home/tnh5hc/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
    source ~/.profile
fi
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

source $ZSH/oh-my-zsh.sh
bindkey '^ ' autosuggest-accept


export PATH="$HOME/.cargo/bin:$PATH"

alias sde='docker-compose build --pull dev-env && docker-compose run --rm dev-env'
alias ls='exa --icons --colour=always -l'
alias lst='exa --icons --colour=always --tree --level=2 -l'


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# zinit pack"binary" for fzf
zinit wait lucid light-mode for \
  atinit'zicompinit' \
    Aloxaf/fzf-tab \
  atinit'zicompinit; zicdreplay' \
    zdharma-continuum/fast-syntax-highlighting \
  atload'_zsh_autosuggest_start; bindkey "$key[Up]" history-beginning-search-backward; bindkey "$key[Down]" history-beginning-search-forward' \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  hcgraf/zsh-sudo \
  arzzen/calc.plugin.zsh \
  zpm-zsh/undollar

# confizure fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


# marlonrichert/zsh-autocomplete \
# as"program" pick"bin/git-fuzzy" \
#   bigH/git-fuzzy \
# ytakahashi/igit \


# todo autojump https://github.com/wting/autojump
# custom prompt symbol when running in docker container
# to use this add 'dockerenv' to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS in ~/.p10k.zsh (e.g. before prompt_char)
function prompt_dockerenv() {
    if [ -f /.dockerenv ]; then
        p10k segment  -i '🐳'
    fi
}

# load powerlevel10k config and plugin
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
zinit light trapd00r/LS_COLORS

