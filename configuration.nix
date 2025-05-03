# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nix-ld.nix

      ./core-modules/fonts.nix
      ./core-modules/steam.nix

      inputs.home-manager.nixosModules.home-manager
    ];

  # Enabling stuff
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';


  # nix-gaming
  nix.settings = {
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };


  system.autoUpgrade.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  services.automatic-timezoned.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erina = {
    isNormalUser = true;
    description = "erina";
    extraGroups = [ "networkmanager" "wheel" "audio" "gamemode" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      neovim
    ];
  };

  # home-manager import
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      erina = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bottles requires this
  programs.dconf.enable = true;

  # Display Stuff
  programs.hyprland.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixd
    nix-prefetch-git

    gparted
    zip
    unzip

    btop
    neovim

    bash
    cargo

    gdb
    clang-tools
    clang

    cl
    zig
    lua
    python3
    nodejs

    ripgrep
    brightnessctl
    playerctl

    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    wineWow64Packages.stagingFull
    winetricks

    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
  ];

  # Options using the pkgs
  nix.nixPath = [ " nixpkgs=${inputs.nixpkgs}" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}


