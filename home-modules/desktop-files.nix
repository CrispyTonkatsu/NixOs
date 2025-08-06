{ ... }: {
  xdg.desktopEntries = {
    "PS2" = {
      name = "PS2";
      type = "Application";
      terminal = false;
      exec = "nvidia-offload pcsx2-qt";
    };

    "steam" = {
      name = "Steam";
      type = "Application";
      terminal = false;
      exec = "steam -forcedesktopscaling 1.75";
      icon = "steam";
      categories = [
        "Network"
        "FileTransfer"
        "Game"
      ];
    };
  };
}
