{ ... }:
{
  services.qbittorrent = {
    enable = true;
    serverConfig = {
      Preferences = {
        WebUI = {
          BanDuration = 10;
        };
        IPFilter = {
          BannedIps = "";
        };
      };
    };
  };

}
