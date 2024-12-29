{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  name = "awrit";

  src = fetchurl {
    url = "https://github.com/chase/awrit/releases/download/v1.0.0/awrit-mac-x86_64.tar.xz";
    sha256 = "";
  };

  meta = with lib; {
    homepage = "https://github.com/chase/awrit/";
    description = "LSP language server for LanguageTool";
    maintainers = with maintainers; [ ciflire ];
  };

}
