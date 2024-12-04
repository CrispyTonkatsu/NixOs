{...} : {
	programs.zathura = {
		enable = true;
		extraConfig = builtins.readFile(./themes/zathura.theme);
	};
}
