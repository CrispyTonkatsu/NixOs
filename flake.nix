{
  description = "Erina's Nixos v2";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    evergarden.url = "github:everviolet/nix";

    pywal-nix = {
      url = "github:Fuwn/pywal.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { self, nixpkgs, stylix, ... } @inputs:
    let
      system = "x86_64-linux";


    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };

          modules = [
            stylix.nixosModules.stylix
            ./configuration.nix
          ];
        };
      };
    };
}
