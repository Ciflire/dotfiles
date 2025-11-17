{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;

    theme = {
      # package = lib.mkForce pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "adwaita-icon-theme";
    };

  };
}
