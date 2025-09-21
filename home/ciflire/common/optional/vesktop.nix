{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    discover-overlay
    overlayed
  ];
  # services.arrpc.enable = true;
}
