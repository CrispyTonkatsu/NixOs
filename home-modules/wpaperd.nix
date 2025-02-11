{ ... }: {

  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/food_paper.jpg;
        mode = "center";
      };
    };
  };
}
