{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    extraPackages = with pkgs; [
      clang-tools
      gcc
      clang
    ];
  };

  home.packages = with pkgs; [ neovide wl-clipboard ];
}
