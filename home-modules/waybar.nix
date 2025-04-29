{ pkgs, ... }: {

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

        "hyprland/window" = {
          "max-length" = 50;
        };

        "hyprland/language" = {
          format = "{}";
          "format-en" = "US";
          "format-en-intl" = "INTL";
          "format-jp" = "JP";
        };

        battery = {
          format = "{capacity}%";
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
          "tooltip-format" = "{tz_list}";
          timezones = [
            "America/Vancouver"
            "America/Vancouver"
            "Asia/Manila"
            "Asia/Tokyo"
          ];
        };

        network = {
          "format" = "{ifname}";
          "format-wifi" = "";
          "format-ethernet" = "󰊗";
          "format-disconnected" = "";
          "max-length" = 50;
        };

        tray = {
          "icon-size" = 21;
          spacing = 10;
        };
      };
    };
  };
}
