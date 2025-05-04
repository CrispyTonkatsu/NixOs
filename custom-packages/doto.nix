{ stdenvNoCC, fetchgit, ... }:
stdenvNoCC.mkDerivation rec {
  name = "doto-font";
  pname = "doto-font";

  src = fetchgit {
    url = "git@github.com:oliverlalan/Doto.git";
    sha256 = "0dgf9xqnn9jc84l2fi1ivm96sp995qmfd5syi3wnlrcczb3i69qh";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ./fonts/variable/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
