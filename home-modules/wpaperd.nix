{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/landscapes/fukuoka.png;
        mode = "center";
        # sorting = "random";
      };
    };
  };
}
