starship init fish | source
set fish_greeting "We are so winning"
fish_default_key_bindings

alias d="ninja -C ./build/debug/ -j(nproc)"
alias dev="nix develop -c fish"
alias nsp="nix-shell --run fish -p"

function nsp; nix-shell --run fish -p $argv; end
