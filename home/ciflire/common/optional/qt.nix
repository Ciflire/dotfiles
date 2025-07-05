{ lib, ... }:
{
  qt = {
    enable = true;
    style.name = lib.mkForce "adwaita-dark";
    platformTheme.name = lib.mkForce "gtk";
  };

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";
  };
}
