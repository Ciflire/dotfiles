{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jdt-language-server
    google-java-format
    zulu
  ];
}
