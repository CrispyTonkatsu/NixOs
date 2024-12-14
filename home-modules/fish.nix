{pkgs, ...} : {
	programs.fish = {
		enable = true;
		shellInit = ''
		starship init fish | source
		set fish_greeting "We are so winning"
		alias d="ninja -C ./build/debug/ -j(nproc)"
		alias dev="nix develop -c fish"
		alias nsp="nix-shell --run fish -p"
		fish_default_key_bindings
		'';
		#fish_vi_key_bindings
	};
}
