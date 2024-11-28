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
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "ciflire";
    repo = "fancy-cat";
    rev = "ed9bddc447fe42810005c41797b72aa85cea2d6a";
    hash = "sha256-azIeL/91rs9LsEFA+uUWGph74UIFv6nzttSLzI8OH2o=";
  };

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
    maintainers = with maintainers; [ figsoda ];
    mainProgram = "fancy-cat";
    inherit (zig.meta) platforms;
  };
}
