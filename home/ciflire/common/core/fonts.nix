{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.monolisa
    pkgs.font-awesome
    pkgs.roboto
    pkgs.source-sans-pro
    pkgs.source-sans
  ];

}
