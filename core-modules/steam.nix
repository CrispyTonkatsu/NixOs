{ config, pkgs, inputs, ... }: {
  # Steam setup
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}
