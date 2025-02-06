{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
