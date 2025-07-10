{ ... }: {
  xdg.desktopEntries = {
    # TODO: Move this to a separate file and add some useful shortcuts
    "PS2" = {
      name = "PS2";
      type = "Application";
      terminal = false;
      exec = "nvidia-offload pcsx2-qt";
    };
  };
}
