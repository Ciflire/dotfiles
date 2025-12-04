{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "adwaita-icon-theme";
    };

    font = {
      name = "DejaVu Sans";
      package = pkgs.dejavu_fonts;
      size = 10;
    };

  };
}
