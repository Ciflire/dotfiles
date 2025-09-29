{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:
let
  version = "0.5.3";
in
buildGoModule {
  name = "plantuml-lsp";

  src = fetchFromGitHub {
    owner = "ptdewey";
    repo = "plantuml-lsp";
    tag = "v${version}";
    hash = "sha256-kI7FpCM0sGO/cjEaYPsKRc4+6d1s1SxDIGKs33ddxts=";
  };

  vendorHash = null;

  subPackages = [ "main.go" ];

  GOFLAGS = [
    ''-o=./plantuml-lsp''
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mv $GOPATH/bin/main $out/bin/plantuml-lsp 

    runHook postInstall
  '';

  meta = with lib; {
    description = "Language Server for PlantUML";
    homepage = "https://github.com/ptdewey/plantuml-lsp";
    license = licenses.mit;
    maintainers = [ ciflire ];
    platforms = platforms.linux;
  };
}
