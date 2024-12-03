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
    owner = "freref";
    repo = "fancy-cat";
    rev = "bd751ae9f4a5169ed19723deb3778ffdccad97e6";
    hash = "sha256-yu0PSSdGQGnZLbFBpCjm54TEP0cC1sKimF39u+A7bOI=";
  };

  patches = [ ./0001-changes.patch ];

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
