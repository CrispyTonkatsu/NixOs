{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    # withUWSM = true;

    extraLuaFiles = {
      "config.decoration" = {
        content = ./hyprland-config/decoration.lua;
      };
      "config.monitors" = {
        content = ./hyprland-config/monitors.lua;
      };

      "config.keybinds" = {
        content = ./hyprland-config/keybinds.lua;
      };
    };

    # TODO: Figure out how to get these other ones to start with UWSM
    # settings = {
    #   exec-once = [
    #     "waybar"
    #     "pa-notify"
    #   ];
    #
    #   input = {
    #     kb_layout = "us,us";
    #     kb_variant = ",intl";
    #     kb_options = "caps:swapescape, grp:alt_shift_toggle";
    #   };
    # };
  };
}
