{ pkgs, ... }:

{
  imports = [
    ./home-modules/gtk.nix
    ./home-modules/git.nix
    ./home-modules/fish.nix
    ./home-modules/nushell.nix
    ./home-modules/starship.nix
    ./home-modules/kitty.nix
    ./home-modules/rofi.nix
    ./home-modules/hyprland.nix
    ./home-modules/swayosd.nix
    ./home-modules/wpaperd.nix
    ./home-modules/hyprlock.nix
    ./home-modules/mako.nix
    ./home-modules/nvim.nix
    ./home-modules/zathura.nix
    ./home-modules/zoxide.nix
    ./home-modules/waybar.nix

    ./home-modules/scripts.nix
    ./home-modules/desktop-files.nix
  ];

  # Allowing unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "erina";
  home.homeDirectory = "/home/erina";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    firefox
    ungoogled-chromium

    pear-desktop
    pulsemixer

    notify-desktop
    hyprshot

    vial

    discord

    jellyfin-desktop
    mpv
    imv
    hyprpicker

    jetbrains.clion
    jetbrains.rider
    jetbrains.rust-rover

    obsidian

    godot-mono
    krita
    gimp3

    # rofi extensions
    rofi-bluetooth

    blueman

    wayvnc

    freecad-wayland
    blender
    # orca-slicer

    # theming
    rose-pine-cursor
    rose-pine-hyprcursor

    thunar
    thunar-media-tags-plugin
    papirus-icon-theme
    file-roller
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/erina/etc/profile.d/hm-session-vars.sh

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  # Default apps
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = [ "nvim.desktop" ];

      "application/pdf" = [ "zathura.desktop" ];

      "image/*" = [ "imv.desktop" ];

      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];

      "inode/directory" = [ "thunar.desktop" ];

      "web-browser" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
