{ ... }:
{
  programs.rofi = {
    enable = true;
    settings.font = "RobotoMono Nerd Font Mono";
    theme = "~/.nixos/home-modules/themes/rofi-theme.rasi";
  };
}
