{...} : {
	programs.waybar = {
		enable = true;
		#style = ./themes/everforest-waybar.css;
		#settings = builtins.fromJSON(builtins.readFile ./themes/everforest-waybar.json);
	};
}
