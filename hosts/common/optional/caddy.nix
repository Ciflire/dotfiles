{ pkgs, ... }:
{
  services.caddy = {
    enable = true;

    virtualHosts = {
      "localhost".extraConfig = ''
        respond "Hello, world!"
      '';
      "git.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:3000
        '';
      };
      "jellyfin.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:8096
        '';
      };
      "lidarr.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:8686
        '';
      };
      "prowlarr.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:9696    
        '';
      };
      "qbittorrent.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:8080   
        '';
      };
      "radarr.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:7878
        '';
      };
      "seerr.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:5055
        '';
      };
      "sonarr.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:8989    
        '';
      };
      "vaultwarden.craplume.fr" = {
        extraConfig = ''
          tls internal
          reverse_proxy 127.0.0.1:8000
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    caddy
    nssTools
  ];
}
