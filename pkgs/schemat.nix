{
  rustPlatform,
  lib,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "schemat";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "raviqqe";
    repo = "schemat";
    tag = "v${version}";
    hash = "sha256-OcxfJLRpP1ktoky7eyFRqkc6FsLks6Ddb4UPKCec83o=";
  };

  # useFetchCargoVendor = true;

  cargoHash = "sha256-JEL8ZA/UNE7f0Cct/O2P3PbF800FjQjxMtdQZ/DXsIw=";

  meta = {
    description = "Code formatter for Scheme, Lisp, and any S-expressions";
    homepage = "https://github.com/raviqqe/schemat";
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [ ciflire ];
    mainProgram = "schemat";
  };
}
