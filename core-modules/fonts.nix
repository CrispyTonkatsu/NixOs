{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    hack-font

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    nerd-fonts.noto
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
  ];
}

