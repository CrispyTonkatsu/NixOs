{
  description = "Erina's Nixos v2";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    base16.url = "github:SenchoPens/base16.nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ...} @inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
	inherit system;

	config.allowUnfree = true;
      };

    in
      {
      nixosConfigurations = {
	default = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs system; };

	  modules = [
	    ./configuration.nix
	  ];
	};
      };
    };

}
