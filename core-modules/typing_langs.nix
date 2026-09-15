{ pkgs, ... }: {
  # NOTE: This is required to get the app to start on its own
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # TODO: Left off here setting up the languages
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;

    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-rose-pine
    ];

    fcitx5.settings = {
      inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us-intl";
        };
        "Groups/0/Items/0" = {
          Name = "keyboard-us-intl";
        };
        "Groups/0/Items/1" = {
          Name = "mozc";
        };
      };
    };
  };
}
