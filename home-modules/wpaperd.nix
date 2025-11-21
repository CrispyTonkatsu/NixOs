{ ... }:
{
  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/active;
        recursive = false;
        sorting = "random";
        duration = "1h";
        mode = "center";
      };
    };
  };
}
