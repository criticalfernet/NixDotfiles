if status is-interactive

	set PATH $PATH $HOME/.cargo/bin
	set -g EDITOR nvim

	zoxide init --cmd cd fish| source

	alias nv nvim
	alias inv 'nvim $(find $HOME -type f | fzf --preview "bat {} --color=always")'
	alias ls 'eza --icons --sort=ext --group-directories-first'
	alias ll 'ls -l --time-style=relative'
	alias la 'll -a'
	alias l ls
	alias nxupdate 'nvim $HOME/Dotfiles/configuration.nix'
	alias nxbuild 'sudo nixos-rebuild switch -I nixos-config=$HOME/Dotfiles/configuration.nix'
	alias nxclean 'sudo nix-collect-garbage'
	alias '..' 'cd ..'
	alias 'dc' 'cd \-'
end
