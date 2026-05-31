{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "craplume";
    package = pkgs.nextcloud32;
    config.dbtype = "sqlite";
    
  };
}
