{ config, lib, ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.email = "leo.vesse@pm.me";
      user.name = "VESSE Léo";
      user.signingkey = lib.mkIf (config.networking.hostName == "vivobook14") "C900ED26D95586C0";
      commit.gpgsign = lib.mkIf (config.networking.hostName == "vivobook14") true;
    };
  };
}
