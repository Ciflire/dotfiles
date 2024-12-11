{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tlaplusToolbox
    framac
  ];
}
