{
  description = "A small flake for Volper's CS classes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = pkgs.mkShell.override
        { }
        {
          packages = with pkgs; [
            pkg-config
            ninja
            cmake
            python3
            valgrind
            gcc
            xxd
          ];

          buildInputs = with pkgs; [
            llvmPackages.clang-tools
          ];
        };
    });
}
