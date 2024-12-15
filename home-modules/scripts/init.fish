starship init fish | source
set fish_greeting (date)

fish_default_key_bindings

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
