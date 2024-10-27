{ lib, stdenvNoCC, requireFile, pkgs }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "monolisa";
  version = "2.015";

  src = requireFile {
    name = "MonoLisa-Complete-2.015.zip";
    sha256 = "0yd3g52khp48yaq6z8ajwahc9x1cz4d0vvl61m919rd0a1zhnq4c";
    message = "";
  };

  unpackPhase = ''
    ${pkgs.unzip}/bin/unzip $src -d MonoLisa
  '';

  # only extract the variable font because everything else is a duplicate
  installPhase = ''
    mkdir -vp $out/share/fonts/variable
    cp -r MonoLisa/ttf/* $out/share/fonts/variable
  '';

  meta = with lib; {
    homepage = "https://www.monolisa.dev";
    description = "Monospace font with programming ligatures";
    longDescription = ''
      Font follow function
    '';
    platforms = platforms.all;
  };
})
