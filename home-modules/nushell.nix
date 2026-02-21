{ config, ... }: {
  programs.nushell = {
    enable = true;

    configFile.source = config.lib.file.mkOutOfStoreSymlink ./scripts/config.nu;
    envFile.source = config.lib.file.mkOutOfStoreSymlink ./scripts/env.nu;
  };
}

