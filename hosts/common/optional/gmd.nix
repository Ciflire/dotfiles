{ pkgs, ... }:
{

  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };
  environment.systemPackages = with pkgs; [
    mysql-shell
    mongosh
    mongodb-compass
  ];
}
