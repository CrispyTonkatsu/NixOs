{...} : {
	programs.kitty = {
		enable = true;
		font.name = "JetBrainsMono Nerd Font Mono";
		settings = {
			background_opacity = "0.9";
			confirm_os_window_close = 0;
			copy_on_select = true;
			clipboard_control = "write-clipboard read-clipboard write-primary";
			font_size = 15;
			cursor_shape = "block";
		};
	};
}