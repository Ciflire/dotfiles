{
  callPackage,
  lib,
  stdenv,
  pkgs,
  fetchFromGitHub,
  zig,
}:

stdenv.mkDerivation {
  pname = "fancy-cat";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "freref";
    repo = "fancy-cat";
    rev = "9b28f097322a0e90154f172318a504a89afcc828";
    hash = "sha256-Wasxhsv4QhGscOEsGirabsq92963S8v1vOBWvAFuRoM=";
  };

  # patches = [ ./0001-changes.patch ];

  nativeBuildInputs = [
    zig.hook
  ];

  buildInputs = with pkgs; [
    zig
    mupdf
    libz
    mujs
    gumbo
    openjpeg
    freetype
    harfbuzz
    libjpeg
    jbig2dec
  ];

  postPatch = ''
    ln -s ${callPackage ./deps.nix { }} $ZIG_GLOBAL_CACHE_DIR/p
  '';

  meta = with lib; {
    description = "PDF viewer for terminals using the Kitty image protocol";
    homepage = "https://github.com/freref/fancy-cat";
    license = licenses.mit;
    maintainers = with maintainers; [ ciflire ];
    mainProgram = "fancy-cat";
    inherit (zig.meta) platforms;
  };
}
