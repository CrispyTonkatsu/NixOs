{pkgs, ...} : {
    programs.rofi = {
	enable = true;
	location = "top";
	font = "JetBrainsMono Nerd Font";
	package = pkgs.rofi-wayland;
	theme = "~/.nixos/home-modules/themes/rofi-everforest.rasi";
    };
}
