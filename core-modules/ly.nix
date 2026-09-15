{ ... }:
{
  services.displayManager.ly = {
    enable = true;

    settings = {
      bigclock = true;

      vi_mode = true;

      animate = true;
      animation = "colormix";
      colormix_col1 = "0x00121358";
      colormix_col2 = "0x00121358";
      colormix_col3 = "0x00232F72";

      load = true;
      save = true;
    };
  };
}
