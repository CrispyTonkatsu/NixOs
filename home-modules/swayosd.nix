{ ... }: {
  services.swayosd = {
    enable = true;
  };

  xdg.configFile."swayosd/style.css".text = ''
    @define-color background-color #000000;
    @define-color border-color #EFEFEF;
    @define-color label #EFEFEF;
    @define-color image #EFEFEF;
    @define-color progress #EFEFEF;
  '';
}
