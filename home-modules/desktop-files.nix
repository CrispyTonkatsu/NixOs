{ ... }: {
  xdg.desktopEntries = {
    "PS2" = {
      name = "PS2";
      type = "Application";
      terminal = false;
      exec = "nvidia-offload pcsx2-qt";
    };
  };
}
