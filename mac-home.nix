{
  pkgs,
  ...
}:
{
  imports = [
    ./home-modules/git.nix
    ./home-modules/kitty.nix
    ./home-modules/nushell.nix
    ./home-modules/zoxide.nix
    ./home-modules/starship.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "erina";
    stateVersion = "23.11";
  };

  targets.darwin.linkApps.enable = true;

  home.packages = with pkgs; [
    firefox
    jetbrains-toolbox
  ];

  programs.nh = {
    enable = true;
    flake = "/Users/erina/.nixos";
  };
}
