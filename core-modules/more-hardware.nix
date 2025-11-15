{
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    ../custom-packages/gpu-udev-symlinks.nix
    ../core-modules/dual-gpu.nix
  ];

  # Specialisations
  specialisation = {
    nvidia-gpu-only.configuration = {
      hardware.nvidia.prime = {
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };

        sync = true;
      };
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

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
        "default.clock.quantum" = 256;
        "default.clock.min-quantum" = 256;
        "default.clock.max-quantum" = 256;
      };
    };
  };

  # Lid setting for external power
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

  # udev stuff (for corne and hyprland gpu stuff)
  services.udev = {
    gpu.symlinks = {
      enable = true;
      gpuNames = [
        "intel"
        "nvidia"
      ];
    };

    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };

  # tablet drivers
  hardware.opentabletdriver.enable = true;
}
