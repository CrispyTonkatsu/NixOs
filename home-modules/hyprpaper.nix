{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload =
        [ "~/.nixos/home-modules/themes/wallpapers/tsubasa_cat.png" ];

      wallpaper =
        [ ",~/.nixos/home-modules/themes/wallpapers/tsubasa_cat.png" ];
    };
  };
}
