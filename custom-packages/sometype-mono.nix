{ stdenvNoCC, fetchgit, ... }:
stdenvNoCC.mkDerivation {
  name = "sometype-mono";
  pname = "sometype-mono";

  src = fetchgit {
    url = "git@github.com:dharmatype/Sometype-Mono.git";
    sha256 = "1fh8jnhwykfx6xlr6v8v8vim4cxd7sf4livaaa8wwx1b0ahxdrnb";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./fonts/ttf/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
