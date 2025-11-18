{
  appimageTools,
  fetchurl,
  makeDesktopItem,
  lib,
}:
appimageTools.wrapType2 rec {
  name = "hyneview";
  version = "4.7.4";

  src = fetchurl {
    url = "https://download.diateam.net/hyneview/linux/4.8.5/DIATEAM_Cyber_Range_hyneview_4.8.5.AppImage";
    hash = "";
  };
  extraPkgs = pkgs: [
    pkgs.libthai
    pkgs.zstd
    pkgs.glib
    pkgs.gdk-pixbuf
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "hyneview";
      exec = "hyneview";
      icon = "hyneview";
      desktopName = "Hyneview";
      comment = meta.description;
      categories = [ "Network" ];
    })
  ];
  meta = {
    description = "Cyberrange platform dedicated to TELECOM Nancy";
    mainProgram = "hyneview";
    maintainers = with lib.maintainers; [ ciflire ];
    platforms = lib.platforms.linux;
  };
}
