{ libcava, fetchFromGitHub }:
libcava.overrideAttrs {
  version = "0.10.6";

  src = fetchFromGitHub {
    owner = "Jas-SinghFSU";
    repo = "cava";
    rev = "b8f6c8d2004a7ab914905650d09bf9b704f1e4b6";
    hash = "sha256-63be1wypMiqhPA6sjMebmFE6yKpTj/bUE53sMWun554=";
  };
}
