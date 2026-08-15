{ ... }:
{
  xdg.desktopEntries = {
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
