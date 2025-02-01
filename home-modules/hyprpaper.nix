{ ... }: {
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
