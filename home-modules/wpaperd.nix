{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers;
        sorting = "random";
        duration = "1h";
        mode = "center";
      };
    };
  };
}
