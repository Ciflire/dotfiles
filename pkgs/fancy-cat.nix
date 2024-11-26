{
  lib,
  stdenv,
  fetchFromGitHub,
  zig_0_11,
}:

stdenv.mkDerivation {
  pname = "fancy-cat";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "freref";
    repo = "fancy-cat";
    rev = "bd751ae9f4a5169ed19723deb3778ffdccad97e6";
    hash = "sha256-zyxjUFxg+VufEVycYGCQPdjERE3p5Vz5iIi2UDujEjI=";
  };

  nativeBuildInputs = [
    zig_0_11.hook
  ];

  meta = with lib; {
    description = "Minisign reimplemented in Zig";
    homepage = "https://github.com/jedisct1/zig-minisign";
    license = licenses.isc;
    maintainers = with maintainers; [ figsoda ];
    mainProgram = "minizign";
    inherit (zig_0_11.meta) platforms;
  };
}
