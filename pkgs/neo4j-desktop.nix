{
  appimageTools,
  lib,
  fetchurl,
}:
let
  pname = "neo4j-desktop";
  version = "2.0.5";

  src = fetchurl {
    url = "https://neo4j.com/artifact.php?name=neo4j-desktop-${version}-x86_64.AppImage";
    hash = "sha256-afru67/OLW5xLPpXG7hjDn2vzb3XiBTAPmvVLXZKUPQ=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: [ pkgs.libsecret ];

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "GUI front-end for Neo4j";
    homepage = "https://neo4j.com/";
    license = licenses.unfree;
    maintainers = [ maintainers.bobvanderlinden ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "neo4j-desktop";
  };
}
