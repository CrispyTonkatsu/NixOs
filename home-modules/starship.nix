{ ... }: {
  programs.starship = {
    enable = true;

    settings = builtins.readFile ./scripts/jetpack.toml;

    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}
