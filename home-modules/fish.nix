{...} : {
	programs.fish = {
		enable = true;
		shellInit = ''
		starship init fish | source
		set fish_greeting "We are so winning"
		alias d="ninja -C ./build/debug/ -j(nproc)"
		alias dev="nix develop -c fish"
		'';
		
	};
}
