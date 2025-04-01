{ ... }: {
  programs.kitty = {
    enable = true;
    font.name = "RobotoMono Nerd Font Mono";
    shellIntegration.enableFishIntegration = true;
    # Themes I like: Afterglow, ayu, ayu mirage, Blazer, Everforest, Japanesque
    themeFile = "Afterglow";
    settings = {
      background_opacity = "0.9";
      confirm_os_window_close = 0;
      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = 14;
      disable_ligatures = "always";
      # cursor_trail = 1;
      # clear_all_shortcuts = true;
    };
  };
}
