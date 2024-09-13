{pkgs, libs} : {
	programs.fish = {
		enable = true;
		shellInit = "starship init fish | source";
	};
}
