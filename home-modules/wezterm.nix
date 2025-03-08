{ ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./scripts/wezterm.lua;
  };
}
