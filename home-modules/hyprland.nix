{...} : {

	wayland.windowManager.hyprland = {
		enable = true;

		extraConfig = ''
			monitor = eDP-1, preferred, auto, 2
			monitor = HDMI-A-3, preferred, auto-left, 1
			monitor = DP-4, preferred, auto, 2
			monitor = DP-5, preferred, auto, 2
			monitor = DP-6, preferred, auto, 2

			input:touchpad:natural_scroll = true

			env = HYPRCUROR_SIZE, 60
			env = HYPRCURSOR_THEME, rose-pine-hyprcursor

			env = XCURSOR_SIZE, 30

			exec-once = waybar
		'';


		settings = {
			"exec-once" = "hyprpaper";
			"$mod" = "SUPER";

			general = {
				border_size = 2;
				"col.active_border" = "rgb(62f59f) rgb(f8fc9f) 45deg";
			};

			input = {
				kb_layout = "us";
				kb_variant = [
					",qwerty" 
					# "intl"
				];
				kb_options = [
					"grp:alt_shift_toggle"
					"caps:swapescape"
				];
			};

			decoration = {
				rounding = 3;
			};

			gestures = {
				workspace_swipe = true;
				workspace_swipe_invert = true;
				workspace_swipe_create_new = false;
			};

			animation = [
				"workspaces, 1, 3, default, slidefadevert"
			];

			bind = [
				# Game Mode
				"$mod, F1, exec, ~/.nixos/home-modules/scripts/gamemode.sh"

				# Window management
				"$mod, Q, killactive"
				"$mod, M, fullscreen"
				"$mod, F, togglefloating"
				"$mod, C, centerwindow"
				"$mod, C, centerwindow"

				# Focus movement
				"$mod, H, movefocus ,l"
				"$mod, L, movefocus ,r"
				"$mod, J, movefocus ,d"
				"$mod, K, movefocus ,u"
				"$mod CTRL, J, workspace, r+1"
				"$mod CTRL, K, workspace, r-1"

				# Window movement
				"$modSHIFT, H, movewindow ,l"
				"$modSHIFT, L, movewindow ,r"
				"$modSHIFT, J, movewindow ,d"
				"$modSHIFT, K, movewindow ,u"
				"$mod CTRL SHIFT, J, movetoworkspace, r+1"
				"$mod CTRL SHIFT, K, movetoworkspace, r-1"

				"$mod, TAB, swapactiveworkspaces, eDP-1 DP-5"

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
				"$mod, SPACE, exec, tofi-run | fish"
				"$mod SHIFT, SPACE, exec, tofi-run | nvidia-offload | fish"
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

			bindm = [ 
				"SUPER, mouse:272, movewindow" 
				"SUPER, mouse:273, resizewindow" 
			];

			xwayland = {
				force_zero_scaling = true;
				use_nearest_neighbor = true;
			};
		};

	};
}
