{ inputs, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
  };

  xdg.configFile."yazelix/yazi" = {
    source = ./config;
    recursive = true;
  };
}
