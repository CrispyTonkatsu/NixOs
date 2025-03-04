{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/BocchiPaper2.jpg;
        mode = "center";
        # sorting = "random";
      };
    };
  };
}
