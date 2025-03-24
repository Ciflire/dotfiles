{
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tlafmt";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "domodwyer";
    repo = "tlafmt";
    rev = "569c6b6b1717ad385446361cceb7858fc6133d32";
    hash = "sha256-e/ImdV5SVRyDMDNs1wmI67xQbH6tTxRlTilGQ6Dqkoc=";
  };

  useFetchCargoVendor = true;

  cargoHash = "sha256-UAYajXmKPg9Ow3iRqcEhT50YP+i4ZKWOHTTrYR1SzhI=";

  meta = {
    description = "A formatter for TLA+ specs";
    homepage = "https://github.com/domodwyer/tlafmt";
    license = lib.licenses.apsl20;
    maintainers = with lib.maintainers; [ ciflire ];
    mainProgram = "tlafmt";
  };
}
