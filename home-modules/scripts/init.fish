starship init fish | source
set fish_greeting (cat ~/.nixos/home-modules/scripts/ascii-art/shinobu.txt)

fish_default_key_bindings

set -x OBSIDIAN_REST_API_KEY "19a8e650b5cefa8b2001566bebff57af8808ef6b002fcff3e2b516b781b8498e"

abbr --add nsp nix-shell --run fish -p
abbr --add dev nix develop -c fish
abbr --add rebuild sudo nixos-rebuild switch --flake ~/.nixos/#default

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
