{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.monolisa
    pkgs.font-awesome
    pkgs.roboto
    pkgs.noto-fonts-emoji
    pkgs.source-sans-pro
    pkgs.source-sans
    pkgs.libertine
  ];

}
