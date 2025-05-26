{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/kita.png;
        mode = "center";
        # sorting = "random";
      };
    };
  };
}
