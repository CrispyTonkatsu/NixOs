{ pkgs, ... }: {
  programs = {
    gh-dash = {
      enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [ gh-dash ];
    };

    git = {
      enable = true;

      settings = {
        user = {
          name = "Edgar Jose Donoso Mansilla";
          email = "edguitar.dm@gmail.com";
        };

        alias = { };

        url = {
          "https://github.com/" = { insteadOf = "gh:"; };
        };

        init.defaultBranch = "main";
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
        http.sslVerify = false;
      };

    };

    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
