{...} : {
	programs.waybar = {
		style = builtins.readFile ./themes/waybar.css;
		settings = {
			spacing = 10;
			modules-left = [
				"hyprland/window"
			];
			modules-right = [
				"hyprland/language"
				"network"
				"battery"
				"clock"
				"tray"
			];
			"hyprland/window" = {
				"max-length" = 50;
			};
			"hyprland/language" = {
				format = "{}";
				"format-en" = "en";
				"format-es" = "sp";
				"format-jp" = "jp";
			};
			battery = {
				format = "{capacity}%";
				"format-icons" = [
					"\uf244"
					"\uf243"
					"\uf242"
					"\uf241"
					"\uf240"
				];
			};
			clock = {
				format = "{:%F %H:%M}";
				"tooltip-format" = "{tz_list}";
				timezones = [
					"America/Vancouver"
					"Asia/Manila"
				];
			};
			network = {
				format = "{ifname}";
				"format-wifi" = "\uf1eb";
				"format-ethernet" = "\udb80\ude97";
				"format-disconnected" = "";
				"max-length" = 50;
			};
			tray = {
				"icon-size" = 21;
				spacing = 10;
			};
		};
	};
}
