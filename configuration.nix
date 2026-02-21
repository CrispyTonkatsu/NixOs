{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./core-modules/fonts.nix
    ./core-modules/steam.nix
    ./core-modules/typing_langs.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  # Enabling stuff
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # nixos store optimization
  nix.optimise.automatic = true;

  system.autoUpgrade.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # TODO: Keep messing around until you find a setup that works automatically and syncs time nicely across windows and linux
  # Setting the time server
  time.hardwareClockInLocalTime = true;
  services.automatic-timezoned.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  users.users.erina = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
    shell = pkgs.nushell;
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
    nixfmt
    nixpkgs-fmt
    nix-prefetch-git
    nix-search-cli

    zip
    unzip
    p7zip

    fzf

    btop
    neovim

    bash
    cargo

    gdb
    clang-tools
    clang
    perf

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
    faudio

    # me when firefox needs this
    ffmpeg

    # OS setup stuff
    gparted
    parted
    popsicle
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
  networking.firewall.enable = true;
  # Using tdp for wayvnc
  networking.firewall.allowedTCPPorts = [ 5900 ];
  # Find what this is for (i forgot) (could be the 3d printer)
  networking.firewall.allowedUDPPorts = [ 3131 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Printing Service
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
