{ pkgs, lib, ... }:
{
  qt = {
    enable = true;
    style.package = pkgs.kdePackages.breeze;
    style.name = "Breeze";
    # platformTheme.name = lib.mkForce "gtk";
  };

}
