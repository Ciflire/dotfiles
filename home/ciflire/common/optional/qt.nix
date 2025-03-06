{ lib, ... }:
{
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk";
  };

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";
  };
}
