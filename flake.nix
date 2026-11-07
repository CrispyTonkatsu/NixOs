{
  description = "Erina's Nixos v2";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      home-manager,
      darwin,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      darwinConfigurations."Erinas-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };

        extraSpecialArgs = {
          isNixOS = false;
        };

        modules = [
          home-manager.darwinModules.home-manager
          ./mac-config.nix
        ];
      };

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };

          extraSpecialArgs = {
            isNixOS = true;
          };

          modules = [
            ./configuration.nix
            ./hardware/hardware-configuration.nix
          ];
        };
      };

      homeConfigurations."erina" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          isNixOS = false;
        };

        modules = [
          ./cachy.nix
          {
            home.username = "erina";
            home.homeDirectory = "/home/erina";
          }
        ];
      };
    };
}
