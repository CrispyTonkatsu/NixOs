{ pkgs, ... }:
let
  sometype-mono = pkgs.callPackage ./../custom-packages/sometype-mono.nix { };
in
{

  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    hack-font

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    nerd-fonts.noto
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono

    sometype-mono
  ];
}

