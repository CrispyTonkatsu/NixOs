{ config, pkgs, inputs, ... }:{
# Steam setup
boot.kernelPackages = pkgs.linuxPackages; # (this is the default) some amdgpu issues on 6.10
programs = {
  gamescope = {
    enable = true;
    capSysNice = true;
  };
  steam = {
    enable = true;
    gamescopeSession.enable = true;
};
  };
hardware.xone.enable = true; # support for the xbox controller USB dongle
}
