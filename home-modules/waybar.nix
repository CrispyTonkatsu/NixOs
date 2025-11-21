{ pkgs, ... }:
{
  home.packages = with pkgs; [ wireplumber ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = builtins.readFile ./themes/waybar.css;
    settings = {
      mainBar = {
        modules-left = [
          "hyprland/window"
        ];
        modules-right = [
          "hyprland/language"
          "network"
          "battery"
          "clock"
          "tray"
        ];

        "hyprland/language" = {
          "format" = "{short} {variant}";
        };

        "hyprland/window" = {
          "max-length" = 50;
        };

        battery = {
          format = "{icon}  {capacity}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        clock = {
          format = "{:%F %H:%M}";
        };

        network = {
          format-wifi = "{essid}";
          format-ethernet = "ethernet";
          format-disconnected = "no-connection";
          max-length = 10;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };
  };
}
