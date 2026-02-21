{ config, inputs, ... }:
{
  programs.nushell = {
    enable = true;

    configFile.source = config.lib.file.mkOutOfStoreSymlink ./scripts/config.nu;
    envFile.source = config.lib.file.mkOutOfStoreSymlink ./scripts/env.nu;

    extraEnv = ''
      $env.NIX_PATH = "nixpkgs=${inputs.nixpkgs.outPath}:."
    '';

  };
}
