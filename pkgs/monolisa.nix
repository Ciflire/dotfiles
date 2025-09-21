{
  lib,
  fetchzip,
  nerd-font-patcher,
  pkgs,
  stdenvNoCC,
  requireFile,
}:
let
  patcher = fetchzip {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FontPatcher.zip";
    hash = "sha256-/LbO8+ZPLFIUjtZHeyh6bQuplqRfR6SZRu9qPfVZ0Mw=";
    stripRoot = false;
  };
in

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "monolisa";
  version = "2.016";

  src = requireFile {
    name = "MonoLisa-Complete-${finalAttrs.version}.zip";
    sha256 = "sha256-2Fj0ocLWnG2eAjHpR04AypHWrS8r6OFsPJsbTJRcvnk=";
    message = "";
  };

  unpackPhase = ''
    ${pkgs.unzip}/bin/unzip $src -d MonoLisa
  '';

  buildInputs = [ nerd-font-patcher ];

  # only extract the variable font because everything else is a duplicate
  installPhase = ''
    mkdir -vp $out/share/fonts/variable
    for filename in MonoLisa/ttf/*.ttf; do
     fontforge -script ${patcher}/font-patcher $filename -c --quiet -s; 
    done
    cp -r *.ttf  $out/share/fonts/variable
  '';

  meta = {
    homepage = "https://www.monolisa.dev";
    description = "Monospace font with programming ligatures";
    platforms = lib.platforms.all;
  };
})
