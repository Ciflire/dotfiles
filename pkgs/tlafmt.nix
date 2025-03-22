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
    tag = "v${version}";
    hash = "sha256-V7KTzjCLOdt31UO01iTHVk2zpPc+GdSpsrEfwwbjZrk=";
  };

  useFetchCargoVendor = true;

  cargoHash = "sha256-KUN7Et3wW5oLu+FK7ySWKSqpo1IL0ggww74IpFX0aSQ=";

  meta = {
    description = "A formatter for TLA+ specs";
    homepage = "https://github.com/domodwyer/tlafmt";
    license = lib.licenses.apsl20;
    maintainers = with lib.maintainers; [ ciflire ];
    mainProgram = "tlafmt";
  };
}
