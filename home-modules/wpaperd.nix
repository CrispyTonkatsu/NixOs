{ lib, pkgs, ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers;
        recursive = false;
        sorting = "random";
        duration = "1h";
        mode = "center";
      };
    };
  };

  # Disabling the auto start so that it only enables with hyprland
  systemd.user.services.wpaperd.Install.WantedBy = lib.mkForce [ ];
}
