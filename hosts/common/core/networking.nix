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

}
