{ config, pkgs, ... }:

{
	imports = [
		./git.nix
	];

# Home Manager needs a bit of information about you and the paths it should
# manage.
	home.username = "erina";
	home.homeDirectory = "/home/erina";


# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
	home.stateVersion = "24.05"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
		home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
		(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment=
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
			pkgs.floorp
			pkgs.rofi-wayland
		];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
	home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';

#		(pkgs.kitty-themes.override { theme = [ "JetBrainsMono" ]; })

	};

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/erina/etc/profile.d/hm-session-vars.sh
#
	home.sessionVariables = {
		EDITOR = "nvim";
	};

# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

# MODULARIZE THE FOLLOWING

# Default apps
	xdg.mimeApps.defaultApplications = {
		"text/plain" = ["nvim"];
		"applicaiton/pdf" = ["zathura.desktop"];
		"image/*" = ["sxiv.desktop"];
		"video/png" = ["mpv.desktop"];
		"video/jpg" = ["mpv.desktop"];
		"video/*" = ["mpv.desktop"];
	};

# Programs
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

	programs.starship = {
		enable = true;
		settings = {
		add_newline = false;
		};
	};

	programs.fish = {
		enable = true;
		shellInit = "starship init fish | source";
	};

# Notification daemon
	services = {
		mako.enable = true;
	};

# Hyprland settings
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$mod" = "SUPER";
			bind = [
				"$mod, F, exec, floorp"
					"$mod, Q, killactive"
					"$mod, SPACE, exec, rofi -show drun -show-icons"
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
			"exec-once" = "waybar";
		};
	};

# Waybar settings
programs.waybar = {
enable = true;
};
}
