{ lib, stdenvNoCC, fetchurl, makeBinaryWrapper, jre_headless }:

stdenvNoCC.mkDerivation rec {
  pname = "ltex-ls-plus";
  version = "18.2.0";

  src = fetchurl {
    url = "https://github.com/ltex-plus/ltex-ls-plus/releases/download/${version}/ltex-ls-plus-${version}.tar.gz";
    sha256 = "sha256-lW1TfTckqhCmhjcvduISY9qAdKPM/0cobxbIrCq5JkQ=";
  };

  nativeBuildInputs = [ makeBinaryWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -rfv bin/ lib/ $out
    rm -fv $out/bin/.lsp-cli.json $out/bin/*.bat
    for file in $out/bin/{ltex-ls-plus,ltex-cli-plus}; do
      wrapProgram $file --set JAVA_HOME "${jre_headless}"
    done

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://ltex-plus.github.io/ltex-plus/";
    description = "LSP language server for LanguageTool";
    license = licenses.mpl20;
    maintainers = with maintainers; [ vinnymeller ];
    platforms = jre_headless.meta.platforms;
  };
}
