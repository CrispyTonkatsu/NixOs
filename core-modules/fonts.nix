{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (callPackage ../custom-packages/doto.nix { })

    hack-font

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    nerd-fonts.noto
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
  ];
}
