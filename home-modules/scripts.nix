{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      (writeShellScriptBin "volpy-setup" (builtins.readFile ./scripts/on-path/volpy-setup.py))
    ];
}
