{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./home-modules/git.nix
    ./home-modules/kitty.nix
    ./home-modules/nushell.nix
    ./home-modules/zoxide.nix
    ./home-modules/starship.nix
    ./home-modules/zathura.nix

    inputs.mac-app-util.homeManagerModules.default
  ];

  programs.home-manager.enable = true;

  home = {
    username = "erina";
    stateVersion = "23.11";
  };

  targets.darwin.linkApps.enable = true;

  home.packages = with pkgs; [
    firefox
  ];

  programs.nh = {
    enable = true;
    flake = "/Users/erina/nixos";
  };
}
