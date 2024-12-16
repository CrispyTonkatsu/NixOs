{ pkgs, ... }: {
  # TODO: Left off setting up the greeter
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "erina";
      };
      default_session = initial_session;
    };
  };
}
