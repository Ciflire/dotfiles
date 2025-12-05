{ pkgs, ... }:
{
  home.packages = [
    #Music Player
    pkgs.spotify
    pkgs.high-tide
    pkgs.spotify-player
    pkgs.sioyek
    pkgs.vscode
  ];
}
