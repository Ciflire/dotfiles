{ stdenv, makeWrapper }:
stdenv.mkDerivation {
  pname = "cheddar";
  version = "3.3.1";

  src = fetchTarball {
    url = "https://beru.univ-brest.fr/svn/CHEDDAR/releases/Cheddar-3.3.1-Linux-bin.tar.gz";
    sha256 = "0glcldjd2snmfz50nrklhac1qjig3j8z2kz5v5dcgs994qc51mcy";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''

    mkdir -p $out/{bin,lib}

    cp ./cheddar $out/bin/
    cp -r ./lib/* $out/lib

    wrapProgram\
      $out/bin/cheddar\
      --prefix "CHEDDAR_INSTALL_PATH" : $out/bin\
      --prefix "LIBRARY_PATH" : $out/lib\
      --prefix "FONTCONFIG_PATH" : $out/lib/etc/fonts\
      --prefix "FONTCONFIG_FILE" : $out/lib/etc/fonts/fonts.conf\
      --prefix "GDK_PIXBUF_MODULE_FILE" : $out/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache\
      --prefix "GDK_PIXBUF_MODULEDIR" : $out/lib/gdk-pixbuf-2.0/2.10.0/loaders\
      --prefix "GIO_EXTRA_MODULES" : $out/lib/gio/modules\
      --prefix "XDG_DATA_DIRS" : $out/lib/share\
      

  '';
}
