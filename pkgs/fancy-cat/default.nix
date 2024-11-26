{
  lib,
  stdenv,
  fetchFromGitHub,
  zig_0_13,
}:

stdenv.mkDerivation {
  pname = "fancy-cat";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "freref";
    repo = "fancy-cat";
    rev = "bd751ae9f4a5169ed19723deb3778ffdccad97e6";
    hash = "sha256-yu0PSSdGQGnZLbFBpCjm54TEP0cC1sKimF39u+A7bOI=";
  };

  nativeBuildInputs = [
    zig_0_13.hook
  ];

  meta = with lib; {
    description = "PDF viewer for terminals using the Kitty image protocol";
    homepage = "https://github.com/freref/fancy-cat";
    license = licenses.mit;
    maintainers = with maintainers; [ figsoda ];
    mainProgram = "fancy-cat";
    inherit (zig_0_11.meta) platforms;
  };
}
