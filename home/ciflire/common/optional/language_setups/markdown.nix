{ pkgs, ... }:
{
  home.packages = with pkgs; [
    glow
    markdown-oxide
    marksman
  ];
}
