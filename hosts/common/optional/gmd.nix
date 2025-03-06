{ pkgs, ... }:
{

  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };

  services.elasticsearch = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    mysql-shell
    mongosh
    mongodb-compass
  ];
}
