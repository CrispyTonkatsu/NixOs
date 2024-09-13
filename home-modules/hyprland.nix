{...} : {


	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"exec-once" = "hyprpaper";
			"$mod" = "SUPER";
			bind = [
				"$mod, F, exec, floorp"
				"$mod, Q, killactive"
				"$mod, SPACE,exec, rofi -show drun -show-icons"
				"$mod, P, exec, kitty"
				"$mod, M, fullscreen"
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
