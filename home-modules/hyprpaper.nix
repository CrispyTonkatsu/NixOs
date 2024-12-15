{...} : {
	services.hyprpaper = {
		enable = true;
		settings = {
			ipc = "on";
			splash = false;

			preload =
				["./themes/BocchiPaper.jpg"];

			wallpaper = [
				",./themes/BocchiPaper.jpg"
			];
		};
	};
}
