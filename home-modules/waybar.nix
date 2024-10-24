{...} : {
	programs.waybar = {
		enable = true;
		style = ./themes/waybar.css;
		settings = builtins.fromJSON (builtins.readFile ./themes/waybar.json);
	};
}
