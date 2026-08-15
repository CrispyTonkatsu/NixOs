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

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
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
    }

    # Shells made to edit this environment
    // flake-utils.lib.eachDefaultSystem (
      local-system:
      let
        pkgs = nixpkgs.legacyPackages.${local-system};
      in
      {
        devShells.default = pkgs.mkShell {
          name = "NixOS config edit shell";

          packages = with pkgs; [
            lua-language-server
            nixd
          ];

          HYPRLAND_STUBS = "${pkgs.hyprland}/share/hypr/stubs";

          shellHook = ''
            # Dynamically generate .luarc.json pointing to the exact current nix package stubs
            cat << EOF > .luarc.json
            {
              "workspace": {
                "library": [
                  "${pkgs.hyprland}/share/hypr/stubs"
                ]
              },
              "diagnostics": {
                "globals": ["hl"]
              }
            }
            EOF

            echo "LSP configuration generated for this Hyprland version."
          '';
        };
      }
    );
}
