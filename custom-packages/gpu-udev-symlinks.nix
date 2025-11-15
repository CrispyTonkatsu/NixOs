{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.udev.gpu.symlinks;
  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;
in
{
  options.services.udev.gpu.symlinks = {
    enable = mkEnableOption "create symlinks to all available gpus";
    gpuNames = mkOption {
      type = with types; listOf str;
      default = [ ];
      description = "List of GPUs to create the symlink for";
    };
  };

  config = mkIf cfg.enable {
    services.udev.packages =
      [ ]
      ++ builtins.map (
        name: pkgs.callPackage ./gpu-udev-finder.nix { gpuVendorName = name; }
      ) cfg.gpuNames;
  };
}
