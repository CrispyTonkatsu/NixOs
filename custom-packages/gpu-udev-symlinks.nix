{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.udev.gpu.symlinks;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.services.udev.gpu.symlinks = {
    enable = mkEnableOption "create symlinks to all available gpus";
  };

  # TODO: Use a set and iterate over it instead of hardcoding the values
  config = mkIf cfg.enable {
    services.udev.packages = [
      (pkgs.callPackage ./gpu-dev-finder.nix { gpuVendorName = "intel"; })
      (pkgs.callPackage ./gpu-dev-finder.nix { gpuVendorName = "nvidia"; })
      (pkgs.callPackage ./gpu-dev-finder.nix { gpuVendorName = "amd"; })
    ];
  };
}
