{...} : {

	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"exec-once" = "hyprpaper";
			"$mod" = "SUPER";

			bind = [
				# Window management
				"$mod, Q, killactive"
				"$mod, M, fullscreen"
				"$mod, F, togglefloating"

				# Focus movement
				"$mod, H, movefocus ,l"
				"$mod, L, movefocus ,r"
				"$mod, J, movefocus ,d"
				"$mod, K, movefocus ,u"

				# Window movement
				"$modSHIFT, H, movewindow ,l"
				"$modSHIFT, L, movewindow ,r"
				"$modSHIFT, J, movewindow ,d"
				"$modSHIFT, K, movewindow ,u"

				# Monitor management
				", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
				", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

				# Media Keys
				", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				# Requires playerctl
				", XF86AudioPlay, exec, playerctl play-pause"
				# TODO: get these two lines to actually do sth
				", , exec, playerctl previous"
				", , exec, playerctl next"

				# Executing programs
				"$mod, SPACE, exec, [floating] rofi -show combi -modes combi -combi-modes \"window,drun,run\""
				"$mod, RETURN, exec, kitty"
			]
				++ (
					# workspaces bindings
					# binds $mod + SHIFT to move between workspaces
					builtins.concatLists(builtins.genList (i:
						let ws = i + 1;
						in [
							"$mod, code:1${toString i}, workspace, m~${toString ws}"
							"$mod SHIFT, code:1${toString i}, movetoworkspace, m~${toString ws}"
						]
					)
						9)
				);
		};
	};
}
