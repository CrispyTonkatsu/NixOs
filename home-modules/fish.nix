{...} : {
	programs.fish = {
		enable = true;
		shellInit = builtins.readFile(./scripts/init.fish);
	};
}
