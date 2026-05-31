{ ... }:
{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      25565
      80
      443
      22
    ];
    allowedUDPPorts = [ 25565 ];
  };

  networking.hosts = {
    "127.0.0.1" = [
      "git.craplume.fr"
      "jellyfin.craplume.fr"
      "lidarr.craplume.fr"
      "prowlarr.craplume.fr"
      "qbittorrent.craplume.fr"
      "seerr.craplume.fr"
      "sonarr.craplume.fr"
      "radarr.craplume.fr"
      "vaultwarden.craplume.fr"
    ];
    "::1" = [
      "git.craplume.fr"
      "jellyfin.craplume.fr"
      "lidarr.craplume.fr"
      "prowlarr.craplume.fr"
      "qbittorrent.craplume.fr"
      "seerr.craplume.fr"
      "sonarr.craplume.fr"
      "radarr.craplume.fr"
      "vaultwarden.craplume.fr"
    ];
  };

}
