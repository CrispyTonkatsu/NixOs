{ ... }: {
  # Notification daemon
  services.mako = {
    enable = true;

    settings = {
      default-timeout = "2000";
      background-color = "#26233a";
      text-color = "#e0def4";
      border-color = "#524f67";
      progress-color = "#31748f";
    };
  };
}

