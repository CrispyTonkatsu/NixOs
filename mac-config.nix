{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./core-modules/fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    ripgrep
    fzf

    nixd
    nixfmt
    dbus

    tree-sitter
    lua
    luarocks
    nushell
    neovim
    mesa
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    allowUnsupportedSystem = true;
  };

  users.users.erina = {
    home = "/Users/erina";
    shell = pkgs.nushell;
  };

  environment.shells = with pkgs; [ nushell ];

  system.primaryUser = "erina";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    useGlobalPkgs = true;
    useUserPackages = true;
    users.erina = import ./mac-home.nix;
    backupFileExtension = "backup";
  };
}
