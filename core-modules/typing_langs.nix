{ pkgs, ... }: {
  # NOTE: This is required to get the app to start on its own
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-rose-pine
    ];
  };
}
