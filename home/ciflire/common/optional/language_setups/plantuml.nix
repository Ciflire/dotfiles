{ pkgs, ... }:
{
  home.packages = with pkgs; [
    plantuml-lsp
    graphviz
    plantuml
  ];
}
