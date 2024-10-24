{lib, ...} : {
	programs.waybar = {
		style = ./themes/waybar.css;
		settings = lib.importJSON (./themes/waybar.json);
	};
}
