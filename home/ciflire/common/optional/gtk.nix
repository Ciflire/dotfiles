{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;

    theme = {
      # package = lib.mkForce pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox_Dark-2";
    };

  };
}
