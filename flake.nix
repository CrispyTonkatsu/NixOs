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

  outputs =
    { nixpkgs, stylix, ... }@inputs:
    let
      system = "x86_64-linux";

    in
    {
      # TODO: Figure out how to make more configs for this flake that way we can have one w out the nvidia gpu
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };

          modules = [
            stylix.nixosModules.stylix
            ./configuration.nix
            ./hardware-configuration.nix
          ];
        };
      };
    };
}
