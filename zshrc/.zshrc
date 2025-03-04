#eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zenful.toml)"
eval "$(starship init zsh)"


eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export ZSH="/nix/store/0pn1878v285l3nrfcagbb93bkkkbm811-oh-my-zsh-2024-10-01/share/oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom


#ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh


# PLUGINS
source /nix/store/*-zsh-autosuggestions*/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /nix/store/*-zsh-syntax-highlighting*/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias inv='nvim $(fzf -m --preview "bat --color=always {}")'
alias update="sudo nixos-rebuild switch"
alias ls="ls --color"
alias ll="ls -lFh"
alias ".."="cd .."
alias "pipes"="pipes.sh"
