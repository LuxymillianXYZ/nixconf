alias ff='fastfetch'
alias syu='cd /etc/nixos; sudo nix flake update; sudo nixos-rebuild switch --upgrade; reboot'
alias nixconf='sudo vim /etc/nixos/configuration.nix'
alias bashrel='clear && source ~/.bashrc'
alias nixdot='cd /etc/nixos/dotfiles'
alias ls='eza --icons'
alias nixfl='sudo yazi /etc/nixos'


PS1='\[\e[38;5;92m\]\u\[\e[0m\]@\[\e[38;5;40m\]\h\[\e[0m\] \[\e[38;5;220m\]\w\[\e[0m\] -> '

ff
