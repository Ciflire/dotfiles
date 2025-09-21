{ pkgs, ... }:
{
  home.packages = [
    #Music Player
    pkgs.spotify
    pkgs.spotify-player
    pkgs.sioyek
    pkgs.vscode
  ];
}
