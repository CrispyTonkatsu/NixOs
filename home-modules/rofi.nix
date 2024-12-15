{pkgs, ...} : {
    programs.rofi = {
	enable = true;
	location = "top";
	# font = "Noto Sans";
	package = pkgs.rofi-wayland;
	theme = "~/.nixos/home-modules/themes/rofi-everforest.rasi";
    };
}
