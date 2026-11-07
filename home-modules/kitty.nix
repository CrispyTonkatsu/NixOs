{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "Hack";
    themeFile = "ayu";

    settings = {
      shell = "${pkgs.nushell.outPath}/bin/nu";
      linux_display_server = "wayland";
      remember_window_size = false;

      background_opacity = "0.9";
      confirm_os_window_close = 0;

      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = if pkgs.stdenv.hostPlatform.isLinux then 14 else 20;
      disable_ligatures = "always";

      cursor = "none";
      cursor_background = "none";
      cursor_trail = 0;
      cursor_blink_interval = "0.5 ease-in-out ";
      cursor_stop_blinking_after = 10.0;
    };
  };
}
