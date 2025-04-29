starship init fish | source
set fish_greeting (random choice "We are so back!!!" "<3" "<2" "Merry Christmas!!!!" "nya~ <3")

fish_default_key_bindings

set -x OBSIDIAN_REST_API_KEY "19a8e650b5cefa8b2001566bebff57af8808ef6b002fcff3e2b516b781b8498e"

# Little details
abbr --add :q exit
abbr --add :po poweroff

# Nixos Commands
abbr --add nsp nix-shell --run fish -p
abbr --add dev nix develop -c fish
abbr --add rebuild sudo nixos-rebuild switch --flake ~/.nixos/#default

# Rust stuff
abbr --add rb cargo build
abbr --add rr cargo run

# C++ building stuff
function d -d "Build the ninja project in the current dir"
	if test -d ./build/debug/
		command ninja -C ./build/debug/ -j(nproc)
	else
		command ninja -C ./build/ -j(nproc)
	end
end

function make-n -d "Call make up to the number provided"
	command make (seq 0 $argv)
end
