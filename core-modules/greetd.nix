{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t -g 'fleeting' --asterisks --cmd start-hyprland";
      };
    };
  };
}
