

ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ];then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git
fi

source "${ZINIT_HOME}/zinit.zsh"


# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit


export PATH=$HOME/.cargo/bin:$PATH

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"


# KEYBINDING
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


#HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


#STYLING
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


#ALIASES
alias vi='nvim'
alias neofetch='fastfetch'
alias inv='nvim $(find $HOME -type f | fzf -m --preview "bat --color=always {}")'
alias update="sudo nixos-rebuild switch"
alias ls="eza --group-directories-first --icons --sort=extension"
alias ll="ls -l --time-style=relative --smart-group"
alias la="ll -a"
alias ".."="cd .."
alias "pipes"="pipes.sh"
alias open="xdg-open"

