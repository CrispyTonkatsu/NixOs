{ ... }:
{
  services.displayManager.ly = {
    enable = true;

    settings = {
      bigclock = true;

      vi_mode = true;

      animate = true;
      animation = "colormix";
      colormix_col1 = "0x005E244E";
      colormix_col2 = "0x00E68457";

      load = true;
      save = true;
    };
  };
}
