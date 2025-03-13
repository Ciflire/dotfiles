{
  callPackage,
  lib,
  stdenv,
  pkgs,
  pkg-config,
  fetchFromGitHub,
  zig,
}:
stdenv.mkDerivation {
  pname = "fancy-cat";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "freref";
    repo = "fancy-cat";
    rev = "8b073a4dc20d75856f303592ca6ccd46648e2ae6";
    hash = "sha256-ziHtPfK9GOxKF800kk+kh12Fwh91xbjDYx9wv2pLZWI=";
  };

  patches = [ ./0001-changes.patch ];

  nativeBuildInputs = [
    pkg-config
    zig
  ];

  buildInputs = with pkgs; [
    mupdf
    harfbuzz
    freetype
    jbig2dec
    libjpeg
    openjpeg
    gumbo
    mujs
    libz
  ];

  buildPhase = ''
    # Set Zig's cache directory
    export ZIG_GLOBAL_CACHE_DIR=$TMPDIR/zig-cache

    zig build --release=fast --system ${callPackage ./deps.nix { }} -Dcpu="skylake"
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $TMPDIR/source/zig-out/bin/fancy-cat $out/bin/

    runHook postInstall
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
