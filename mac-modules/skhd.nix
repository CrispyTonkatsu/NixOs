{ pkgs, ... }:
{
  services.skhd = {
    enable = false;

    config = ''
      ctrl - 1 : open -a kitty
      ctrl - 2 : open -a firefox
      ctrl - 3 : open -a discord
    '';
  };
}
