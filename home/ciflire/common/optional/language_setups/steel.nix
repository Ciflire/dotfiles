{ inputs, pkgs, ... }:
{
  home.packages = [
    pkgs.steel
    pkgs.schemat
  ];
}
