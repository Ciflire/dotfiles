{
  stdenv,
  fetchFromGitHub,
  gradle,
  makeWrapper,
  lib,
  jre,
  msp430GccSupport,
  ncurses,
  pkg-config,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "cooja";
  version = "./deps.json";

  src = fetchFromGitHub {
    owner = "contiki-ng";
    repo = "cooja";
    rev = "c17f7fdd5f224486ddbacc4c57f336e73a958b21";
    hash = "sha256-jrofWbygoDqkCpr7ZZPj+HWCrx/lPVPbZMV9Zy00YDc=";
    fetchSubmodules = true;
  };

  buildInputs = [
    msp430GccSupport
    ncurses
  ];

  nativeBuildInputs = [
    gradle
    makeWrapper
    pkg-config
  ];

  # if the package has dependencies, mitmCache must be set
  mitmCache = gradle.fetchDeps {
    pkg = finalAttrs.finalPackage;
    data = ./deps.json;
  };

  # this is required for using mitm-cache on Darwin
  # __darwinAllowLocalNetworking = true;

  gradleFlags = [ "-Dfile.encoding=utf-8" ];

  # defaults to "assemble"
  # gradleBuildTask = "shadowJar";

  # will run the gradleCheckTask (defaults to "test")
  doCheck = true;

  installPhase = ''

    mkdir -p $out/{bin,share/cooja}

    cp build/libs/cooja-full.jar $out/share/cooja

    makeWrapper \
    ${lib.getExe jre} $out/bin/cooja\
    --prefix "MSP430_GCC_INCLUDE_DIR" : msp430GccSupport/include\
    --add-flags "-Xms400M -Xmx2048M -XX:-UseCompressedOops -XX:-UseCompressedClassPointers --enable-preview --enable-native-access ALL-UNNAMED -jar $out/share/cooja/cooja-full.jar"

  '';

  meta.sourceProvenance = with lib.sourceTypes; [
    fromSource
    binaryBytecode # mitm cache
  ];
})
