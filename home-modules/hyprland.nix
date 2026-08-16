{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;

    extraLuaFiles = {
      "config.system" = {
        content = ./hyprland-config/system.lua;
      };

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
  };
}
