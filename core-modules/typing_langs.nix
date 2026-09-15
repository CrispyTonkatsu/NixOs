{ pkgs, ... }: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;

    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-rose-pine
    ];

    # We want to use the one that is declared here
    fcitx5.ignoreUserConfig = true;
    fcitx5.settings = {
      inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0" = {
          Name = "keyboard-us";
        };
        "Groups/0/Items/1" = {
          Name = "keyboard-us-intl";
        };
        "Groups/0/Items/2" = {
          Name = "mozc";
        };
      };
    };
  };
}
