{ stdenv, fetchTarball }:
stdenv.mkDerivation (finalAttrs: {
  pname = "msp430-toolchain";
  version = "9.3.1.11";

  src = fetchTarball {
    url = "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-LlCjWuAbzH/9.3.1.2/msp430-gcc-${finalAttrs.version}_linux64.tar.bz2";
    hash = "";
  };

  installPhase = ''
    ls -r
    fjksfjs
  '';

})
