{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    greetd.greetd
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "agreety --cmd Hyprland";
      };
    };
  };

}
