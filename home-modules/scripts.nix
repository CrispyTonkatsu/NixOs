{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      (writeScriptBin "volpy-setup" (builtins.readFile ./scripts/on-path/volpy-setup.py))
    ];
}
