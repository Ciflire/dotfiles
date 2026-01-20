{ pkgs, ... }:
{
  xdg.mime.enable = true;
  xdg.menus.enable = true;

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [

    kdePackages.dolphin
  ];
}
