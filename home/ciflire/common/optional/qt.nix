{ pkgs, lib, ... }:
{
  qt = {
    enable = true;
    style.package = pkgs.adwaita-qt;
    style.name = lib.mkForce "Adwaita-dark";
    # platformTheme.name = lib.mkForce "gtk";
  };

}
