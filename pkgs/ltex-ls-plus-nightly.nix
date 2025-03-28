{
  lib,
  stdenvNoCC,
  fetchurl,
  makeBinaryWrapper,
  jre_headless,
}:

stdenvNoCC.mkDerivation rec {
  pname = "ltex-ls-plus";
  version = "18.5.0-alpha.nightly.2025-03-09";

  src = fetchurl {
    url = "https://github.com/ltex-plus/ltex-ls-plus/releases/download/nightly/ltex-ls-plus-${version}.tar.gz";
    sha256 = "sha256-qb+W5foyjkBDpMMVuKO8M/vy/oA5EoKoMdpcSyGX+z8=";
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
    maintainers = with maintainers; [ ciflire ];
    platforms = jre_headless.meta.platforms;
  };
}
