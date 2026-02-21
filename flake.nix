{
  description = "Erina's Nixos v2";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      mac-app-util,
      darwin,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

    in
    {
      darwinConfigurations."Erinas-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.darwinModules.home-manager
          mac-app-util.darwinModules.default
          ./mac-config.nix
        ];
      };

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };

          modules = [
            ./configuration.nix
            ./hardware/hardware-configuration.nix
          ];
        };
      };
    };
}
