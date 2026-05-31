{ ... }:
{
  services.jellyfin = {
    enable = true;
    user = "ciflire";
    openFirewall = true;
  };
}
