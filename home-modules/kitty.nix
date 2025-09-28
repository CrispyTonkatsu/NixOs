{ ... }: {
  programs.kitty = {
    enable = true;
    font.name = "Hack";

    settings = {
      shell = "nu";
      linux_display_server = "wayland";

      background_opacity = "0.9";
      confirm_os_window_close = 0;

      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = 14;
      disable_ligatures = "always";

      cursor = "none";
      cursor_background = "none";
      cursor_trail = 1;
      cursor_blink_interval = "0.5 ease-in-out ";
      cursor_stop_blinking_after = 10.0;
    };

    extraConfig = ''
      # Flow colorscheme | Kitty 
      # https://github.com/0xstepit/flow.nvim

      # Basic colors
      background #1f282e
      foreground #d1dbe0
      selection_foreground #ff007b 
      selection_background #0d0d0d 

      # Normal colors
      color0 #0d0d0d
      color1 #c98288
      color2 #88c982
      color3 #c9c982
      color4 #82acc9
      color5 #a682c9
      color6 #82c9b8
      color7 #f2f2f2

      # Bright colors
      color8 #3d505c
      color9 #c98288
      color10 #88c982
      color11 #c9c982
      color12 #82acc9
      color13 #a682c9
      color14 #82c9b8
      color15 #f2f2f2

      # Url color
      url_color #82acc9

      # Cursor
      cursor #ff007b
      cursor_text_color #0d0d0d

      # Tabs
      active_tab_background #82acc9 
      active_tab_foreground #0d0d0d
      inactive_tab_background #3d505c
      inactive_tab_foreground #82acc9

      # Borders
      active_border_color #828ec9 
      inactive_border_color #3d505c
    '';

  };
}
