{ config, inputs, ... }: {

  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Nvidia setup
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # This setting is required
    modesetting.enable = true;

    # Nvidia power management. Experimental and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issue s or application crashes after waking up
    # from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the Nvidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at the nix wiki
    # Currently in alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu.
    # accessible via 'nvidia-settings'
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    ##### Pull rq to the nix nvidia page that they should rec using nix-shell for the lshw so the user doesn't need to install it

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Ibus details
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Power Control
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;

  # Audio Setup
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 512;
      };
    };
  };

  # Lid setting for external power
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

  # #udev stuff (for corne)
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  # tablet drivers
  hardware.opentabletdriver.enable = true;
}
