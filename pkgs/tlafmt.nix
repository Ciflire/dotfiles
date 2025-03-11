{
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tlafmt";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "domodwyer";
    repo = "tlafmt";
    rev = "v${version}";
    hash = "sha256-xx77i+GmwD5NicSSit8FMkHS52kMBXnp3kFrjNy57NE=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = src + "/Cargo.lock";
  };

  meta = with lib; {
    description = "A formatter for TLA+ specs";
    homepage = "https://github.com/domodwyer/tlafmt";
    license = licenses.apsl20;
    maintainers = with maintainers; [ ciflire ];
    mainProgram = "tlafmt";
  };
}
