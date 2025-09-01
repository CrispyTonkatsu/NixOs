{ ... }: {
  programs.starship = {
    enable = true;

    settings = { };

    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}
