{ config, pkgs, ... }:

{
  imports = [
    ./home-modules/git.nix
    ./home-modules/fish.nix
    ./home-modules/starship.nix
    ./home-modules/kitty.nix
    ./home-modules/wezterm.nix
    ./home-modules/rofi.nix
    ./home-modules/hyprland.nix
    ./home-modules/wpaperd.nix
    ./home-modules/hyprlock.nix
    ./home-modules/waybar.nix
    ./home-modules/mako.nix
    ./home-modules/nvim.nix
    ./home-modules/zathura.nix
    ./home-modules/zoxide.nix
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
  home.packages = with pkgs;[
    floorp
    ungoogled-chromium
    youtube-music

    notify-desktop
    pa-notify
    hyprshot

    vial

    vesktop
    mpv
    sxiv

    jetbrains.clion
    jetbrains.rider
    rpcs3

    xfce.thunar

    obsidian

    gcalcli

    bottles

    godot_4
    krita

    #shitposting ah
    gif-for-cli
    cppreference-doc
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
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  # Default apps
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "nvim" ];
    "applicaiton/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "sxiv.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "web-browser" = [ "floorp" ];
    "inode/directory" = [ "dolphin" ];
  };

  # TODO: Move this to a separate file and add actually useful ones. (MS teams and what not)
  xdg.desktopEntries = {
    penguine = {
      name = "PenguinPosting";
      comment = "Penguin gets slapped";
      exec = "gif-for-cli -l=0 https://tenor.com/view/penguin-slap-gif-5263949288532448516";
      terminal = true;
      type = "Application";
      categories = [ "Game" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
