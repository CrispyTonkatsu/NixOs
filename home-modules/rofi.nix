{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    location = "center";
    font = "NotoSansMono Nerd Font Mono";
    package = pkgs.rofi-wayland;
    theme = "~/.nixos/home-modules/themes/rofi-everforest.rasi";
  };
}
