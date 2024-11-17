{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    #Music Player
    spotify

    sioyek
    vscode
  ];
}
