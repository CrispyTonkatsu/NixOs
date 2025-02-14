{ ... }: {

  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers;
        mode = "center";
        sorting = "random";
      };
    };
  };
}
