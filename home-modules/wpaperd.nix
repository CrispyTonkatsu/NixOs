{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers;
        recursive = false;
        sorting = "random";
        duration = "1h";
        mode = "center";
      };
    };
  };
}
