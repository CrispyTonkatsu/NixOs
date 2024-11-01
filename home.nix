{ config, pkgs, inputs, theme, ... }:

{
	imports = [
		./git.nix
		./home-modules/fish.nix
		./home-modules/kitty.nix
		./home-modules/hyprland.nix
		./home-modules/zoxide.nix
		./home-modules/starship.nix
		./home-modules/nvim.nix
		#./home-modules/rofi.nix
		./home-modules/tofi.nix
		./home-modules/mako.nix
		./home-modules/waybar.nix
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

	# Unfree
	nixpkgs.config.allowUnfree = true; 

	# The home.packages option allows you to install Nix packages into your
	# environment.
	home.packages = [
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
		# Desktop apps
		pkgs.floorp
		pkgs.obsidian
		pkgs.vesktop
		pkgs.zathura
		pkgs.mpv
		pkgs.sxiv
		pkgs.jetbrains.clion
		pkgs.notify-desktop
		pkgs.pa-notify

		pkgs.rpcs3

		pkgs.ani-cli

		pkgs.gimp
		pkgs.imagemagick
		pkgs.poppler_utils
		pkgs.qiv
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

	# Default apps
	xdg.mimeApps.defaultApplications = {
		"text/plain" = ["nvim"];
		"applicaiton/pdf" = ["zathura.desktop"];
		"image/*" = ["sxiv.desktop"];
		"video/png" = ["mpv.desktop"];
		"video/jpg" = ["mpv.desktop"];
		"video/*" = ["mpv.desktop"];
		"web-browser" = ["floorp"];
	};


	services.hyprpaper = {
		enable = true;
		settings = 
			{
				ipc = "on";
				splash = false;

				preload =
					["/home/erina/Downloads/ranmapaper3.jpg" ];

				wallpaper = [
					", /home/erina/Downloads/ranmapaper3.jpg"
				];
			};
	};

}
