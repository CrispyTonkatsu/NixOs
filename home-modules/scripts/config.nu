$env.config.buffer_editor = "nvim"

$env.config.show_banner = false

alias rebuild = sudo nixos-rebuild switch --flake /home/erina/.nixos/#default
alias store-clean = sudo nix-collect-garbage --delete-older-than 14d

alias q = exit
alias spo = poweroff

alias dev = nix develop -c nu
alias nsp = nix-shell --run nu -p

