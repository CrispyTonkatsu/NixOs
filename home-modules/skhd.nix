{ ... }:
{
  services.skhd = {
    enable = true;

    config = ''
      # open terminal, blazingly fast compared to iTerm/Hyper
      cmd - return : /Applications/kitty.app/Contents/MacOS/kitty --single-instance -d ~
    '';
  };
}
