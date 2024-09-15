{...} : {
	programs.fish = {
		enable = true;
		shellInit = ''
		starship init fish | source
		set fish_greeting "We are so winning"
		'';
		
	};
}
