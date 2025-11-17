{ pkgs, ... }:
{
  home.packages = with pkgs; [
    easyeffects
    coppwr
  ];
}
