{ ... }: {
  # TODO: learn how to set this up so that this is what we boot to
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 3;
        hide_cursor = true;
        fractional_scaling = 1;
      };

      background = {
        path = "~/.nixos/home-modules/themes/Monogatari.png";
        blur_passes = 3;
        blur_size = 8;
        brightness = 0.5;
      };

      input-field = [
        {
          size = "500, 100";
          position = "0, -50";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_family = "NotoSansMono Nerd Font Mono";
          font_color = "rgb(251, 228, 220)";
          inner_color = "rgb(70, 36, 44)";
          outer_color = "rgb(192, 197, 212)";
          outline_thickness = 3;
          placeholder_text = "'\'<span>Password...</span>'\'";
          shadow_passes = 2;
        }
      ];

      label = {
        text = "cmd[update:1000] echo \"<span>$(date \"+%Y-%m-%d %H:%M\")</span>\"";
        font_family = "NotoSansMono Nerd Font Mono";
        color = "rgb(251, 228, 220)";
        font_size = 32;
        position = "0, 50";
        halign = "center";
        valign = "center";
      };
    };
  };
}
