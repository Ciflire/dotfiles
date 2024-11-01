{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
    extraPortals = with pkgs; [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
