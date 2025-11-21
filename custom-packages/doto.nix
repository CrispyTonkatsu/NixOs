{ stdenvNoCC, fetchgit, ... }:
stdenvNoCC.mkDerivation {
  name = "doto-font";
  pname = "doto-font";

  # TODO: Fix the font package
  src = fetchgit {
    url = "https://github.com/oliverlalan/Doto.git";
    sha256 = "sha256-ECcTx/qMZWr5iF6X5iouKV1tUt0xRCcoQUwma3FP7jU=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./fonts/variable/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
