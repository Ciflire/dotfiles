{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fiji
  ];
}
