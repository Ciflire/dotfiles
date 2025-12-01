{ pkgs, ... }:
{
  services.hadoop.gatewayRole.enableHbaseCli = true;
  services.hadoop.hbase = {
    master.enable = true;
    master.openFirewall = true;
    thrift.enable = true;
    rest.enable = true;
    package = pkgs.hbase3;
  };

  environment.systemPackages = with pkgs; [
    jetbrains.idea-community
  ];
}
