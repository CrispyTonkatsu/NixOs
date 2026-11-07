{ pkgs, ... }:
{
  imports = [
    ./home-modules/zoxide.nix
    ./home-modules/nushell.nix
    ./home-modules/starship.nix
    ./home-modules/kitty.nix
  ];

  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
