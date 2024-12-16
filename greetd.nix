{ ... }: {
  # Will not use it because its weird to ensure hyprlock works well here
  services.greetd = {
    enable = true;
    settings = {
      environments = [
        "Hyprland"
        "fish"
      ];

      initial_session = { };

      default_session = {
        command = "Hyprland";
        user = "erina";
      };
    };
  };
}
