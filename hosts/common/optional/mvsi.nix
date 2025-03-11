{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tlaplusToolbox
    framac
    tlafmt
    tlaplus
    graphviz
  ];
}
