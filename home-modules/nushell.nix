{ ... }: {
  programs.nushell = {
    enable = true;
    extraConfig = builtins.readFile ./scripts/config.nu;
  };
}

