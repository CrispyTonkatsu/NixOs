{ ... }: {

  services.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = ./themes/wallpapers/active;
        recursive = false;
        sorting = "random";
        duration = "1h";
        mode = "center";
      };
    };
  };

  # # Disabling the auto start so that it only enables with hyprland
  # # TODO: Make this enable at a nix level for nicer rebuilds
  # systemd.user.services.wpaperd.Install.WantedBy = lib.mkForce [ ];
}
