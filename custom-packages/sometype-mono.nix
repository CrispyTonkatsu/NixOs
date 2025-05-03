{ stdenvnoCC, fetchgit, ... }:
stdenvnoCC.mkDerivation rec {
  name = "sometype-mono";

  src = fetchgit {
    url = "git@github.com:dharmatype/Sometype-Mono.git";
    hash = "sha256-f21476e52c6c6e88102e7888602b209db3695cc3";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
