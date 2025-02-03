{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ mysql-shell ];
}
