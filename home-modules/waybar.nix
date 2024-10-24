{pkgs, ...} : {

	home.packages = with pkgs; [wireplumber];

	programs.waybar = {
		enable = true;
		package = pkgs.waybar;
		style = builtins.readFile ./themes/waybar.css;
		settings = {
			mainBar = {
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
						""
						""
						""
						""
						""
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
					"format" = "{ifname}";
					"format-wifi" = "";
					"format-ethernet" = "󰊗";
					"format-disconnected" = "";
					"max-length" = 50;
				};
				tray = {
					"icon-size" = 21;
					spacing = 10;
				};
			};
		};
	};
}
