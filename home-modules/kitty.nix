{ ... }: {
  programs.kitty = {
    enable = true;
    font.name = "Hack";

    shellIntegration.enableFishIntegration = true;
    themeFile = "atelier-sulphurpool-dark";

    settings = {
      linux_display_server = "wayland";

      background_opacity = "0.9";
      confirm_os_window_close = 0;

      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = 16;
      disable_ligatures = "always";

      cursor = "none";
      cursor_background = "none";
      cursor_trail = 1;
      cursor_blink_interval = "0.5 ease-in-out ";
      cursor_stop_blinking_after = 5.0;
    };
  };
}
