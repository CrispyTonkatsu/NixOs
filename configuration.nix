# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs ,... }:

{
# Experimental Features
	nix.settings.experimental-features = ["nix-command" "flakes"];

	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
			inputs.home-manager.nixosModules.default
			./nix-ld.nix
		];

# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixy"; # Define your hostname.

# Enable networking
		networking.networkmanager.enable = true;

# Set your time zone.
	time.timeZone = "America/Vancouver";

# Select internationalisation properties.
	i18n.defaultLocale = "en_CA.UTF-8";

# Configure keymap in X11
	services.xserver = {
		xkb.layout = "us";
		xkb.variant = "";
	};

# Programs
	programs = {
		nix-ld.enable = true;
	};
	
	programs = {
		fish.enable = true;
	};

# Hyprland environment vars
	environment.sessionVariables = {
#If the cursor becomes invisible
#WLR_NO_HARDWARE_CURSORS = "1";

#Hint electron apps to use wayland
		NIXOS_OZONE_WL = "1";
	};

# Hyprland hardware vars
	hardware = {
#OpenGL
		graphics.enable = true;

# Most wayland compositors need this
		nvidia.modesetting.enable = true;
	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.erina = {
		isNormalUser = true;
		description = "erina";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.fish;
		packages = with pkgs; [];
	};

# Home Manager
	home-manager = {
		extraSpecialArgs = {inherit inputs; };
		users = {
			"erina" = import ./home.nix;
		};
		backupFileExtension = ".backup";
	};

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#  wget
		vim
		neovim
		cargo
		gcc
		clang
		clang-tools
		cl
		zig
		lua
		luajitPackages.luarocks-nix
		python3
		ripgrep
	];

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?
}