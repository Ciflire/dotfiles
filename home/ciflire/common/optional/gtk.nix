{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;

    theme = {
      package = lib.mkForce pkgs.flat-remix-gtk;
      name = lib.mkForce "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

  };
}
