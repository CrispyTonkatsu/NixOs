{pkgs, ...}: {
  programs = {
    gh-dash = {
      enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [gh-dash];
    };

    git = {
      enable = true;
      userName = "Edgar Jose Donoso Mansilla";
      userEmail = "edguitar.dm@gmail.com";

      extraConfig = {
        url = {
          "https://github.com/" = {insteadOf = "gh:";};
        };

        init.defaultBranch = "main";
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
        http.sslVerify = false;
      };

      aliases = {};

      delta = {
        enable = true;
      };
    };
  };
}
