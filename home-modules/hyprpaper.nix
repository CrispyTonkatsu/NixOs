{ ... }: {

  # TODO: Probably migrate from hyprpaper to wpaperd that way its nicer to change wallpapers on boot or something of the sort

  services.hyprpaper = {
    enable = true;
    settings = {
      preload =
        [ "~/.nixos/home-modules/themes/tsubasa_cat.png" ];

      wallpaper =
        [ ",~/.nixos/home-modules/themes/tsubasa_cat.png" ];
    };
  };
}
