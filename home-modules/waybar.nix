{...} : {
	programs.waybar = {
		enable = true;
		style = ./themes/waybar.css;
		settings = builtins.fromJSON(builtins.readFile ./themes/rose-pine-waybar.json);
	};
}
