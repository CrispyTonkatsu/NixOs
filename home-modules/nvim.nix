{pkgs, ...} : {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
		home.packages = with pkgs; [neovide wl-clipboard];

		extraPackages = with pkgs; [
			# Formatters
			gofumpt
			goimports-reviser
			golines

			# LSP
			gopls
			clang-tools

			# Tools
			go
			gcc
			clang
		];
	};
}
