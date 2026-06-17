{ ... }:
{
  # TODO: Add stackline with hammerspoon

  services.yabai = {
    enable = true;

    config = {
      # Base settings
      layout = "bsp";

      # Mouse settings
      focus_follows_mouse = "autofocus";
      mouse_follows_focus = "on";

      # Window settings
      window_placement = "second_child";
      auto_balance = "on";
      window_opacity = "off";

      top_padding = 5;
      bottom_padding = 5;
      left_padding = 5;
      right_padding = 5;
      window_gap = 5;
    };
  };
}
