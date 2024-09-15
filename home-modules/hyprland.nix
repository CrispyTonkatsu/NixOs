{...} : {

	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"exec-once" = "hyprpaper";
			"$mod" = "SUPER";

			bind = [
				"$mod, Q, killactive"
				"$mod, SPACE, exec, rofi -show drun -show-icons"
				"$mod, \, exec, kitty"
				"$mod, M, fullscreen"
				"$mod, "
				",, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			]
				++ (
					# workspaces bindings
					# binds $mod + SHIFT to move between workspaces
					builtins.concatLists(builtins.genList (i:
						let ws = i + 1;
						in [
							"$mod, code:1${toString i}, workspace, ${toString ws}"
							"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
						]
					)
						9)
				);
		};
	};
}
