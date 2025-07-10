{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    location = "center";
    font = "RobotoMono Nerd Font Mono";
    package = pkgs.rofi-wayland;
    theme = "~/.nixos/home-modules/themes/rofi-theme.rasi";
  };
}
